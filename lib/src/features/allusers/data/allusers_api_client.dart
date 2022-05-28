import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/remote_datasource/endpoints.dart';
import '../../../common/utils/http_errors.dart';
import '../../../common/models/models.dart';

class AllusersApiClient {
  AllusersApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<List<ProfileUser>> fetchUsers() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(
      baseUrl, users,
      // queryParams
    );
    return _getUsers(uri);
  }

  Future<List<ProfileUser>> _getUsers(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    List body;
    try {
      body = json.decode(response.body) as List;
    } catch (_) {
      throw JsonDecodeException();
    }

    try {
      return body.map((dynamic item) {
        final user = User.fromJson(item as Map<String, dynamic>);
        item['company']['userId'] = user.id;
        item['address']['userId'] = user.id;
        item['address']['lng'] = item['address']['geo']['lng'];
        item['address']['lat'] = item['address']['geo']['lat'];

        final company =
            Company.fromJson(item['company'] as Map<String, dynamic>);
        final address =
            Address.fromJson(item['address'] as Map<String, dynamic>);

        return ProfileUser(user: user, address: address, company: company);
      }).toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  }
}
