import 'package:flutter/material.dart';
import '../../../data/models/models.dart';

class ProfilePage extends StatelessWidget {
  static Route route(User user, Address? address, Company? company) {
    return MaterialPageRoute<void>(
        builder: (_) => ProfilePage(
              user: user,
              company: company,
              address: address,
            ));
  }

  const ProfilePage({Key? key, required this.user, this.address, this.company})
      : super(key: key);
  final User user;
  final Address? address;
  final Company? company;

  @override
  Widget build(BuildContext context) {
    return _ProfileView(
      user: user,
      address: address,
      company: company,
    );
  }
}

class _ProfileView extends StatefulWidget {
  final User user;
  final Address? address;
  final Company? company;
  const _ProfileView({
    Key? key,
    required this.user,
    this.address,
    this.company,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  static double maxRadius = 40.0;
  static double minRadius = 8.0;
  double radius = maxRadius;
  double expandedHeader = 130.0;
  double translate = -maxRadius;
  bool isExpanded = true;
  double offset = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (scrollNotification) {
            final pixels = scrollNotification.metrics.pixels;

            final scrollTabs = (scrollNotification.metrics.axisDirection ==
                    AxisDirection.right ||
                scrollNotification.metrics.axisDirection == AxisDirection.left);

            if (!scrollTabs) {
              if (expandedHeader - pixels <= kToolbarHeight) {
                if (isExpanded) {
                  translate = 0.0;
                  setState(() {
                    isExpanded = false;
                  });
                }
              } else {
                translate = -maxRadius + pixels;
                if (translate > 0) {
                  translate = 0.0;
                }
                if (!isExpanded) {
                  setState(() {
                    isExpanded = true;
                  });
                }
              }

              offset = pixels * 0.4;

              final newSize = (maxRadius - offset);

              setState(() {
                if (newSize < minRadius) {
                  radius = minRadius;
                } else if (newSize > maxRadius) {
                  radius = maxRadius;
                } else {
                  radius = newSize;
                }
              });
            }
            return false;
          },
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: expandedHeader,
                backgroundColor: Colors.grey,
                leading: isExpanded
                    ? null
                    : AnimatedContainer(
                        height: 200,
                        width: 100,
                        duration: Duration(seconds: 2),
                        child: Transform(
                          transform: Matrix4.identity()..translate(30.0, 0.0),
                          child: ProfileImage(radius: radius),
                        ),
                      ),

                title: isExpanded
                    ? null
                    : Container(
                        padding: const EdgeInsets.only(left: 32.0, right: 64),
                        child: Text(
                          widget.user.username,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),

                pinned: true,
                elevation: 5.0,
                forceElevated: true,
                // actions: <Widget>[_buildProfileImage(radius)],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      color: isExpanded ? Colors.transparent : Colors.blue[800],
                      image: isExpanded
                          ? DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(
                                'assets/images/abstract.jpg',
                              ),
                            )
                          : null),
                  child: isExpanded
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, maxRadius),
                            child: ProfileImage(radius: radius),
                          ))
                      : SizedBox.shrink(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ProfileHeader(
                          user: widget.user,
                          address: widget.address,
                          company: widget.company),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return _SpaceBox();
                }, childCount: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.radius}) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[800]!,
              width: 2.0,
            ),
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(
              'assets/images/bordeaux-mastif.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

//=================
//  Profile Info
//================
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.user, this.company, this.address});
  final User user;
  final Address? address;
  final Company? company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 64,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 32.0),
                  child: Text("Bio",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _row(title: 'username', text: user.username),
                        SizedBox(
                          height: 16.0,
                        ),
                        _row(title: 'name', text: user.name ?? ''),
                        SizedBox(
                          height: 16.0,
                        ),
                        _row(title: 'email', text: user.email ?? ''),
                        SizedBox(
                          height: 16.0,
                        ),
                        _row(title: 'phone', text: user.phone ?? ''),
                        SizedBox(
                          height: 16.0,
                        ),
                        _row(title: 'website', text: user.website ?? ''),
                        SizedBox(
                          height: 16.0,
                        ),
                      ])),
            ],
          ),
          if (address != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 32.0),
                    child: Text("Address",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Divider(
                          color: Colors.white30,
                        ),
                      ),
                      _row(title: 'street', text: address!.street ?? ''),
                      SizedBox(
                        height: 16.0,
                      ),
                      _row(title: 'suite', text: address!.suite ?? ''),
                      SizedBox(
                        height: 16.0,
                      ),
                      _row(title: 'zip-code', text: address!.zipcode ?? ''),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: _row(
                                  title: 'latitude', text: address!.lat ?? '')),
                          SizedBox(
                              width: 100,
                              child: _row(
                                  title: 'longitude',
                                  text: address!.lng ?? '')),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          if (company != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 32.0),
                    child: Text("Company",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Divider(
                          color: Colors.white30,
                        ),
                      ),
                      _row(title: 'company-name', text: company!.name ?? ''),
                      SizedBox(
                        height: 16.0,
                      ),
                      _row(
                          title: 'catch-phrase',
                          text: company!.catchPhrase ?? ''),
                      SizedBox(
                        height: 16.0,
                      ),
                      _row(title: 'bs', text: company!.bs ?? ''),
                      SizedBox(
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

  Widget _row({required String title, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
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

// =================
//  Profile Body
// =================
class _SpaceBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 16.0),
      shrinkWrap: true,
      gridDelegate: delegate,
      children: <Widget>[
        ...List.generate(15, (intex) => ImageBox()),
      ],
    );
  }
}

class ImageBox extends StatelessWidget {
  final VoidCallback? onTap;
  const ImageBox({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () => onTap,
          child: Stack(children: <Widget>[
            Container(
              child: Image.asset('assets/images/bordeaux-mastif.jpg',
                  fit: BoxFit.fitHeight),
            )
          ]),
        ),
      ),
    );
  }
}
