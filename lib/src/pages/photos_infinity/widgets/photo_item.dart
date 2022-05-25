import 'package:flutter/material.dart';

import '../../../data/models/models.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key, required this.photo, this.onTap})
      : super(key: key);
  final VoidCallback? onTap;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Card(
          elevation: 5,
          child: InkWell(
            onTap: () => onTap,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(photo.url, fit: BoxFit.cover),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.black.withOpacity(.2),
                        child: Text(
                          photo.title ?? '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
