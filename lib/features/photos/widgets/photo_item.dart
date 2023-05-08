// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../../../app/database/drift/database_client.dart';
//
// class PhotoItem extends StatelessWidget {
//   const PhotoItem({Key? key, required this.photo, this.onTap})
//       : super(key: key);
//   final VoidCallback? onTap;
//   final Photo photo;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         alignment: Alignment.center,
//         child: Card(
//           elevation: 5,
//           child: InkWell(
//             onTap: () => onTap,
//             child: Stack(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: CachedNetworkImage(
//                       imageUrl: photo.url, fit: BoxFit.cover),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     verticalDirection: VerticalDirection.up,
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         color: Colors.black.withOpacity(.2),
//                         child: Text(
//                           photo.title ?? '',
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.normal),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
