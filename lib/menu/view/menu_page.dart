import 'package:flutter/material.dart';

import '../../navigator/routes/routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              onPressed: () => const InfinityListRoute().go(context),
              child: const Text('Infinity list'),
            ),
            TextButton(
              onPressed: () => const CatalogUsersRoute().go(context),
              child: const Text('Catalog of users'),
            ),
          ],
        ),
      ),
    );
  }
}
