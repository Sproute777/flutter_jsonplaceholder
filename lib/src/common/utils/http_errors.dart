class HttpException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);
  final int statusCode;
}

class JsonDecodeException implements Exception {}

class JsonDeserializationException implements Exception {}
