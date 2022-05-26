import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/src/data/models/models.dart';
import 'package:flutter_jsonplaceholder/src/features/profile/view/profile_page.dart';

import '../../album/view/album_page.dart';

class ProfileTabBar extends StatefulWidget {
  final ProfileUser user;
  static Route route(ProfileUser user) {
    return MaterialPageRoute<void>(
        builder: (_) => ProfileTabBar(
              user: user,
            ));
  }

  const ProfileTabBar({Key? key, required this.user}) : super(key: key);

  @override
  ProfileTabBarState createState() => ProfileTabBarState();
}

class ProfileTabBarState extends State<ProfileTabBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: [
        ProfilePage(user: widget.user),
        AlbumPage(userId: widget.user.user.id)
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'text'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'text2'),
        ],
        onTap: (int index) {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
