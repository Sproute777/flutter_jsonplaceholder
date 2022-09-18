import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'src/core/database/drift/drift.dart';
import 'src/features/posts/data/posts_api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();

  bootstrap(database: database);
  // runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final post = await PostsApiClient().fetchPosts(1);
        print('${post.toString()}');
      }),
    ));
  }
}
