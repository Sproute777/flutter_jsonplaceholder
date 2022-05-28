import 'package:flutter/material.dart';
import '../remote_datasource/jsonplaceholder_api_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('text', style: TextStyle(color: Colors.black)),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // final repo = await RepositoryProvider.of<TodosRepository>(context);
        final client = JsonplaceholderApiClient();

        try {
          final result = await client.fetchComments();
          print('--------- ${result.toString()}');
        } catch (e) {
          print('>>> ERROR >>> $e ');
        }
      }),
    );
  }
}
