import 'package:dio/dio.dart';

class ClientHttp {
  late final Dio _client;
  final String _baseUrl = const String.fromEnvironment(
    'API_BASE_URL',
  );

  ClientHttp() {
    _client = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _client.interceptors.add(
      LogInterceptor(
        responseBody: true,
      ),
    );
  }

  Future<dynamic> get(String path) async {
    final Response response = await _client.get(path);

    return response.data;
  }

  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    final Response response = await _client.put(
      path,
      data: body,
    );

    return response.data;
  }
}
