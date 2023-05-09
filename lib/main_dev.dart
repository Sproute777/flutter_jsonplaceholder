import 'package:database_client/database_client.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'bootstrap.dart';
import 'package:json_api_client/json_api_client.dart';
import 'package:json_repository/json_repository.dart';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final jsonApiClient = JsonApiClient();
    final databaseClient = DatabaseClient();
    final jsonStorage = JsonStorage(databaseClient);
    final jsonRepository = JsonRepository(jsonApiClient, jsonStorage);

    return App(
      jsonRepository: jsonRepository,
    );
  });
}
