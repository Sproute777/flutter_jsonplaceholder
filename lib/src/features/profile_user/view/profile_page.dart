import 'package:flutter/material.dart';
import '../../../common/models/models.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final ProfileUser user;

  @override
  Widget build(BuildContext context) {
    return _ProfileView(
      user: user,
    );
  }
}

class _ProfileView extends StatelessWidget {
  final ProfileUser user;
  const _ProfileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: _ProfileBody(
            profileUser: user,
          ),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  final ProfileUser profileUser;
  const _ProfileBody({Key? key, required this.profileUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text("Bio",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Row(
                            title: 'username', text: profileUser.user.username),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _Row(title: 'name', text: profileUser.user.name ?? ''),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _Row(
                            title: 'email', text: profileUser.user.email ?? ''),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _Row(
                            title: 'phone', text: profileUser.user.phone ?? ''),
                        const SizedBox(
                          height: 16.0,
                        ),
                        _Row(
                            title: 'website',
                            text: profileUser.user.website ?? ''),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ])),
            ],
          ),
          if (profileUser.address != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text("Address",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          color: Colors.white30,
                        ),
                      ),
                      _Row(
                          title: 'street',
                          text: profileUser.address!.street ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _Row(
                          title: 'suite',
                          text: profileUser.address!.suite ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _Row(
                          title: 'zip-code',
                          text: profileUser.address!.zipcode ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: _Row(
                                  title: 'latitude',
                                  text: profileUser.address!.lat ?? '')),
                          SizedBox(
                              width: 100,
                              child: _Row(
                                  title: 'longitude',
                                  text: profileUser.address!.lng ?? '')),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          if (profileUser.company != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text("Company",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          color: Colors.white30,
                        ),
                      ),
                      _Row(
                          title: 'company-name',
                          text: profileUser.company!.name ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _Row(
                          title: 'catch-phrase',
                          text: profileUser.company!.catchPhrase ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _Row(title: 'bs', text: profileUser.company!.bs ?? ''),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 4),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
