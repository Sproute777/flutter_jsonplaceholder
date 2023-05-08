import 'package:flutter/material.dart';

import 'app/app.dart';
import 'bootstrap.dart';
import 'package:json_api_client/json_api_client.dart';
import 'package:json_repository/json_repository.dart';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final jsonApiClient = JsonApiClient();
    final jsonRepository = JsonRepository(jsonApiClient);

    return App(
      jsonRepository: jsonRepository,
    );
  });
}
