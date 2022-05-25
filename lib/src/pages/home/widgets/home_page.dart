import 'dart:ui';

import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
void main() => runApp(MaterialApp(
    scrollBehavior: const MaterialScrollBehavior()
        .copyWith(dragDevices: {PointerDeviceKind.mouse}),
    home: const ScrollableTab()));

class ScrollableTab extends StatefulWidget {
  static const routeName = '/ScrollableTab';

  const ScrollableTab({Key? key}) : super(key: key);

  @override
  ScrollableTabState createState() => ScrollableTabState();
}

class ScrollableTabState extends State<ScrollableTab> {
  textStyle() {
    return const TextStyle(color: Colors.white, fontSize: 30.0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          // title: Text("Smiple Tab Demo", style: TextStyle(color: Colors.black)),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.home, color: Colors.black),
                    Text('Home', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.person_pin, color: Colors.black),
                    Text('Profile', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.save_alt, color: Colors.black),
                    Text('Saved', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.favorite_border, color: Colors.black),
                    Text('Favorite', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.info_outline, color: Colors.black),
                    Text('About', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.chat, color: Colors.black),
                    Text('Chat', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.settings, color: Colors.black),
                    Text('Settings', style: TextStyle(color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Saved",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Favorite",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "About",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Chat",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
