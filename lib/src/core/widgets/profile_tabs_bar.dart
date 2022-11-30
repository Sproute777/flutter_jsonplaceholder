import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/src/core/route/routes/app_routes.dart';

import '../../features/albums/view/album_page.dart';
import '../../features/posts/view/posts_page.dart';
import '../../features/profile_user/view/profile_page.dart';
import '../models/models.dart';

class ProfileTabBar extends StatefulWidget {
  final ProfileUser user;
  final String kind;

  const ProfileTabBar(this.kind, {Key? key, required this.user})
      : super(key: key);

  @override
  ProfileTabBarState createState() => ProfileTabBarState();
}

class ProfileTabBarState extends State<ProfileTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.kind.toIndex();
    super.initState();
  }

  @override
  void didUpdateWidget(ProfileTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedIndex = widget.kind.toIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: [
        ProfilePage(user: widget.user),
        AlbumPage(userId: widget.user.user.id),
        PostsPage(userId: widget.user.user.id),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'user'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'albums'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'posts'),
        ],
        onTap: (int index) {
          if (_selectedIndex != index) {
            _handleTabTapped(index);
          }
        },
      ),
    );
  }

  void _handleTabTapped(int index) {
    switch (index) {
      case 1:
        AlbumsRoute($extra: widget.user).go(context);
        break;
      case 2:
        PostsRoute($extra: widget.user).go(context);
        break;
      case 0:
      default:
        UserRoute($extra: widget.user).go(context);
        break;
    }
  }
}

extension StringExt on String {
  int toIndex() {
    switch (this) {
      case 'albums':
        return 1;

      case 'posts':
        return 2;

      case 'user':
      default:
        return 0;
    }
  }
}
