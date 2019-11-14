import "package:gql/execution.dart";
import "package:meta/meta.dart";

class ArgumentBuilder {
  final Map<String, dynamic> _json = const <String, dynamic>{};

  const ArgumentBuilder();

  void set(
    String key,
    dynamic value,
  ) =>
      value is ArgumentBuilder ? _json[key] = value._json : _json[key] = value;

  Map<String, dynamic> toJson() => _json;
}

abstract class DataParser<D> {
  D parse(Map<String, dynamic> data);
}

@immutable
class Executor<V extends ArgumentBuilder, D> {
  final Operation operation;
  final DataParser<D> parser;

  const Executor({
    @required this.operation,
    @required this.parser,
  })  : assert(operation != null),
        assert(parser != null);

  Request buildRequest([
    V variables,
    Context context,
  ]) =>
      Request(
        operation: operation,
        variables: variables.toJson(),
        context: context,
      );

  BaseResponse<D> buildResponse(
    Response response,
  ) =>
      BaseResponse<D>(
        errors: response.errors,
        data: parser.parse(response.data),
        context: response.context,
      );
}
