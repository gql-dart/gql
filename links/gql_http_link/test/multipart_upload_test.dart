import "dart:convert";
import "dart:typed_data";

import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import "package:http/http.dart" as http;
import "package:http_parser/http_parser.dart";
import "package:mockito/mockito.dart";
import "package:test/test.dart";

import "./helpers.dart";

class MockClient extends Mock implements http.Client {}

class MockRequestSerializer extends Mock implements RequestSerializer {}

class MockResponseParser extends Mock implements ResponseParser {}

void main() {
  MockClient mockHttpClient;
  HttpLink httpLink;
  Request gqlRequest;

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

  const expectedResponse = r"""
{
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
}
        """;

  group("upload", () {
    setUp(() {
      mockHttpClient = MockClient();

      httpLink = HttpLink(
        "http://localhost:3001/graphql",
        httpClient: mockHttpClient,
      );

      gqlRequest = Request(
        operation: Operation(
          document: parseString(uploadMutation),
        ),
        variables: <String, dynamic>{
          "files": [
            http.MultipartFile.fromBytes(
              "",
              [0, 1, 254, 255],
              filename: "sample_upload.jpg",
              contentType: MediaType("image", "jpeg"),
            ),
            http.MultipartFile.fromString(
              "",
              "just plain text",
              filename: "sample_upload.txt",
              contentType: MediaType("text", "plain"),
            ),
          ],
        },
      );
    });

    test("request encoding", () async {
      Uint8List bodyBytes;
      when(
        mockHttpClient.send(any),
      ).thenAnswer((i) async {
        bodyBytes = await (i.positionalArguments[0] as http.BaseRequest)
            .finalize()
            .toBytes();
        return simpleResponse(expectedResponse);
      });

      await httpLink.request(gqlRequest).first;

      final http.MultipartRequest request = verify(
        mockHttpClient.send(captureAny),
      ).captured.first as http.MultipartRequest;

      final List<String> contentTypeStringSplit =
          request.headers["content-type"].split("; boundary=");

      expect(request.method, "POST");
      expect(request.url.toString(), "http://localhost:3001/graphql");
      expect(request.headers["accept"], "*/*");

      expect(contentTypeStringSplit[0], "multipart/form-data");

      final boundary = contentTypeStringSplit[1];
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
              r'"query":"mutation($files: [Upload!]!) {\n'
              r"  multipleUpload(files: $files) {\n    id\n    filename\n    mimetype\n    path\n  }\n"
              r'}"'
              r"}"
              "\r\n--$boundary"
              '\r\ncontent-disposition: form-data; name="map"\r\n\r\n'
              '{"0":["variables.files.0"],"1":["variables.files.1"]}'
              "\r\n--$boundary"
              "\r\ncontent-type: image/jpeg"
              "\r\ncontent-disposition: form-data;"
              ' name="0"; filename="sample_upload.jpg"\r\n\r\n',
            ),
            0,
            1,
            254,
            255,
            ...utf8.encode(
              "\r\n--$boundary"
              "\r\ncontent-type: text/plain; charset=utf-8"
              "\r\ncontent-disposition: form-data;"
              ' name="1"; filename="sample_upload.txt"\r\n\r\n'
              "just plain text"
              "\r\n--$boundary--\r\n",
            ),
          ],
        ),
      );
    });

    test("response data", () async {
      when(
        mockHttpClient.send(any),
      ).thenAnswer(
        (i) async => simpleResponse(expectedResponse),
      );

      final response = await httpLink.request(gqlRequest).first;

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

    //test("upload fail error response", () {
    //  const String responseBody = json.encode({
    //    "errors":[
    //      {
    //        "message": r"Variable "$files" of required type "[Upload!]!" was not provided.",
    //        "locations": [{ "line" :1, "column" :14 }],
    //        "extensions": {
    //          "code": "INTERNAL_SERVER_ERROR",
    //          "exception": {
    //             "stacktrace": [ r"GraphQLError: Variable "$files" of required type "[Upload!]!" was not provided.", ... ]
    //          }
    //        }
    //      }
    //    ]
    //  });
    //  const int statusCode = 400;
    //});
  });
}
