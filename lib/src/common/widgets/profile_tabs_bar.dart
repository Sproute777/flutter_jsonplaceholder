import 'package:flutter/material.dart';

import '../../features/albums/view/album_page.dart';
import '../../features/posts/view/posts_page.dart';
import '../../features/profile_user/view/profile_page.dart';
import '../models/models.dart';

class ProfileTabBar extends StatefulWidget {
  final ProfileUser user;

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
        PostsPage(userId: widget.user.user.id),
        AlbumPage(userId: widget.user.user.id)
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'text'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'text2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'text3'),
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
