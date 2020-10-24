// ignore_for_file: implicit_dynamic_method, unused_local_variable,implicit_dynamic_map_literal

import "dart:convert";
import "dart:core";
import "dart:typed_data";

import "package:dio/dio.dart" as dio;
import "package:gql/language.dart";
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";
import "package:http_parser/http_parser.dart";

class MockClient extends Mock implements dio.Dio {}

class MockRequestSerializer extends Mock implements RequestSerializer {}

class MockResponseParser extends Mock implements ResponseParser {}

void main() {
  MockClient mockClient;
  DioLink link;

  const String uploadMutation = r"""
    mutation($files: [Upload!]!) {
      multipleUpload(files: $files) {
        id
        filename
        mimetype
        path
      }
    }
    """;

  // in the real world this could be a "file-based" search
  const String uploadQuery = r"""
    query($files: [Upload!]!) {
      multipleUpload(files: $files) {
        id
        filename
        mimetype
        path
      }
    }
    """;

  const expectedResponse = {
    "data": {
      "multipleUpload": [
        {
          "id": "r1odc4PAz",
          "filename": "sample_upload.jpg",
          "mimetype": "image/jpeg",
          "path": "./uploads/r1odc4PAz-sample_upload.jpg"
        },
        {
          "id": "5Ea18qlMur",
          "filename": "sample_upload.txt",
          "mimetype": "text/plain",
          "path": "./uploads/5Ea18qlMur-sample_upload.txt"
        }
      ]
    }
  };

  List<dio.MultipartFile> testFiles() => [
        dio.MultipartFile.fromBytes(
          [0, 1, 254, 255],
          filename: "sample_upload.jpg",
          contentType: MediaType("image", "jpeg"),
        ),
        dio.MultipartFile.fromString(
          "just plain text",
          filename: "sample_upload.txt",
          contentType: MediaType("text", "plain"),
        ),
      ];

  group("upload", () {
    Request gqlRequest;
    setUp(() {
      mockClient = MockClient();

      link = DioLink(
        "http://localhost:3001/graphql",
        client: mockClient,
      );

      gqlRequest = Request(
        operation: Operation(
          document: parseString(uploadMutation),
        ),
        variables: <String, dynamic>{
          "files": testFiles(),
        },
      );
    });

    test("request encoding", () async {
      Uint8List bodyBytes;

      when(mockClient.requestUri<dynamic>(
        any,
        data: anyNamed("data"),
        options: anyNamed("options"),
      )).thenAnswer((i) async {
        final listInt = await (i.namedArguments[Symbol("data")] as dio.FormData)
            .readAsBytes();
        bodyBytes = Uint8List.fromList(listInt);
        return dio.Response<Map<String, dynamic>>(
          data: expectedResponse,
          statusCode: 200,
        );
      });

      await link.request(gqlRequest).first;

      final captured = verify(
        mockClient.requestUri<dynamic>(
          captureAny,
          data: captureAnyNamed("data"),
          options: captureAnyNamed("options"),
        ),
      ).captured;

      final uri = captured[0] as Uri;
      final data = captured[1] as dio.FormData;
      final options = captured[2] as dio.Options;

      expect(options.method, "POST");
      expect(uri.toString(), "http://localhost:3001/graphql");
      expect(options.headers["Accept"], "*/*");

      //this is added with dio if data is dio.FormData
      //expect(contentTypeStringSplit[0], "multipart/form-data");

      final boundary = data.boundary;

      final expected = [
        ...utf8.encode(
          "--$boundary"
          '\r\ncontent-disposition: form-data; name="operations"\r\n\r\n'
          r"{"
          r'"operationName":null,'
          r'"variables":{"files":[null,null]},'
          r'"query":"mutation($files: [Upload!]!) {\n'
          r"  multipleUpload(files: $files) {\n    id\n    filename\n    mimetype\n    path\n  }\n"
          r'}"'
          r"}"
          "\r\n--$boundary"
          '\r\ncontent-disposition: form-data; name="map"\r\n\r\n'
          '{"0":["variables.files.0"],"1":["variables.files.1"]}'
          "\r\n--$boundary"
          "\r\ncontent-disposition: form-data;"
          ' name="0"; filename="sample_upload.jpg"\r\n'
          "content-type: image/jpeg\r\n"
          "\r\n",
        ),
        0,
        1,
        254,
        255,
        ...utf8.encode(
          "\r\n--$boundary"
          "\r\ncontent-disposition: form-data;"
          ' name="1"; filename="sample_upload.txt"'
          "\r\ncontent-type: text/plain; charset=utf-8\r\n\r\n"
          "just plain text"
          "\r\n--$boundary--\r\n",
        ),
      ];

      //NOTE:
      //dio and http reverse the place of content-disposition:
      //and content-type:
      expect(
        /*utf8.decode(*/ bodyBytes,
        /* allowMalformed: true),*/
        equals(
          /*utf8.decode(*/ expected, /* allowMalformed: true),*/
        ),
      );
    });

    test("response data", () async {
      when(mockClient.requestUri<dynamic>(
        any,
        data: anyNamed("data"),
        options: anyNamed("options"),
      )).thenAnswer((i) async => dio.Response<Map<String, dynamic>>(
            data: expectedResponse,
            statusCode: 200,
          ));

      final response = await link.request(gqlRequest).first;

      final multipleUpload = (response.data["multipleUpload"] as List<dynamic>)
          .cast<Map<String, dynamic>>();

      expect(multipleUpload, <Map<String, String>>[
        <String, String>{
          "id": "r1odc4PAz",
          "filename": "sample_upload.jpg",
          "mimetype": "image/jpeg",
          "path": "./uploads/r1odc4PAz-sample_upload.jpg"
        },
        <String, String>{
          "id": "5Ea18qlMur",
          "filename": "sample_upload.txt",
          "mimetype": "text/plain",
          "path": "./uploads/5Ea18qlMur-sample_upload.txt"
        },
      ]);
    });
  });

  group("file upload useGETForQueries behavior", () {
    setUp(() {
      mockClient = MockClient();

      link = DioLink(
        "http://localhost:3001/graphql",
        client: mockClient,
        useGETForQueries: true,
      );
    });

    test("query request encoding with files", () async {
      Uint8List bodyBytes;

      when(mockClient.requestUri<dynamic>(
        any,
        data: anyNamed("data"),
        options: anyNamed("options"),
      )).thenAnswer((i) async {
        final listInt = await (i.namedArguments[Symbol("data")] as dio.FormData)
            .readAsBytes();
        bodyBytes = Uint8List.fromList(listInt);
        return dio.Response<Map<String, dynamic>>(
          data: expectedResponse,
          statusCode: 200,
        );
      });

      final gqlQueryWithFiles = Request(
        operation: Operation(
          document: parseString(uploadQuery),
        ),
        variables: <String, dynamic>{
          "files": testFiles(),
        },
      );

      await link.request(gqlQueryWithFiles).first;

      final captured = verify(
        mockClient.requestUri<dynamic>(
          captureAny,
          data: captureAnyNamed("data"),
          options: captureAnyNamed("options"),
        ),
      ).captured;

      final uri = captured[0] as Uri;
      final data = captured[1] as dio.FormData;
      final options = captured[2] as dio.Options;

      expect(options.method, "POST");
      expect(uri.toString(), "http://localhost:3001/graphql");
      expect(options.headers["Accept"], "*/*");

      //this is added with dio if data is dio.FormData
      //expect(contentTypeStringSplit[0], "multipart/form-data");

      final boundary = data.boundary;
      //NOTE:
      //dio and http reverse the place of content-disposition:
      //and content-type:
      expect(
        bodyBytes,
        equals(
          [
            ...utf8.encode(
              "--$boundary"
              '\r\ncontent-disposition: form-data; name="operations"\r\n\r\n'
              r"{"
              r'"operationName":null,'
              r'"variables":{"files":[null,null]},'
              r'"query":"query($files: [Upload!]!) {\n'
              r"  multipleUpload(files: $files) {\n    id\n    filename\n    mimetype\n    path\n  }\n"
              r'}"'
              r"}"
              "\r\n--$boundary"
              '\r\ncontent-disposition: form-data; name="map"\r\n\r\n'
              '{"0":["variables.files.0"],"1":["variables.files.1"]}'
              "\r\n--$boundary"
              "\r\ncontent-disposition: form-data;"
              ' name="0"; filename="sample_upload.jpg"'
              "\r\ncontent-type: image/jpeg\r\n\r\n",
            ),
            0,
            1,
            254,
            255,
            ...utf8.encode(
              "\r\n--$boundary"
              "\r\ncontent-disposition: form-data;"
              ' name="1"; filename="sample_upload.txt"'
              "\r\ncontent-type: text/plain; charset=utf-8\r\n\r\n"
              "just plain text"
              "\r\n--$boundary--\r\n",
            ),
          ],
        ),
      );
    });
  });
}
