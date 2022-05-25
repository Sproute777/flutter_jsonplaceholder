import 'dart:ui';

import '../../../pages/photos_infinity/view/photo_infinity_page.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(
//     scrollBehavior: MaterialScrollBehavior()
//         .copyWith(dragDevices: {PointerDeviceKind.mouse}),
//     home: HomePage()));

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Jsonplaceholder examples',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text('Infinity photos'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil<void>(
                    PhotoInfinityPage.route(),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
