import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'endpoints.dart';

part 'json_api_client.g.dart';

@RestApi()
abstract class JsonApiClient {
  factory JsonApiClient({Dio? dio, String? baseUrl}) {
    final iDio = dio ?? Dio();
    final iBaseUrl = baseUrl ?? Endpoints.baseUrl;
    return _JsonApiClient(iDio, baseUrl: iBaseUrl);
  }

  @GET(Endpoints.users)
  Future<String> getUsers();

  @GET(Endpoints.users + '/{id}')
  Future<String> getUser(@Path() int id);

  @GET(Endpoints.posts)
  Future<String> getPosts();

  @GET(Endpoints.comments)
  Future<String> getComments();

  @GET(Endpoints.albums)
  Future<String> getAlbums();

  @GET(Endpoints.photos)
  Future<String> getPhotos();

  @GET(Endpoints.todos)
  Future<String> getTodos();
}
