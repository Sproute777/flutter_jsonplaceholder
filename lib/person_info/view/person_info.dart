import 'package:flutter/material.dart';

class PersonInfoPage extends StatelessWidget {
  const PersonInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

//
// class _profileview extends statelesswidget {
//   final profileuser user;
//   const _profileview({key? key, required this.user}) : super(key: key);
//
//   @override
//   widget build(buildcontext context) {
//     return safearea(
//       child: scaffold(
//         backgroundcolor: colors.bluegrey[900],
//         body: singlechildscrollview(
//           physics: const clampingscrollphysics(),
//           child: _profilebody(
//             profileuser: user,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _profilebody extends statelesswidget {
//   final profileuser profileuser;
//   const _profilebody({key? key, required this.profileuser}) : super(key: key);
//
//   @override
//   widget build(buildcontext context) {
//     return padding(
//       padding: const edgeinsets.only(left: 8, right: 8, top: 10.0),
//       child: column(
//         crossaxisalignment: crossaxisalignment.start,
//         children: <widget>[
//           const sizedbox(
//             height: 16,
//           ),
//           row(
//             crossaxisalignment: crossaxisalignment.start,
//             mainaxisalignment: mainaxisalignment.start,
//             children: [
//               const expanded(
//                 flex: 1,
//                 child: padding(
//                   padding: edgeinsets.only(top: 16.0, left: 16.0),
//                   child: text("bio",
//                       style: textstyle(
//                           fontsize: 20,
//                           color: colors.white60,
//                           fontweight: fontweight.bold)),
//                 ),
//               ),
//               expanded(
//                   flex: 3,
//                   child: column(
//                       crossaxisalignment: crossaxisalignment.start,
//                       children: [
//                         _row(
//                             title: 'username', text: profileuser.user.username),
//                         const sizedbox(
//                           height: 16.0,
//                         ),
//                         _row(title: 'name', text: profileuser.user.name ?? ''),
//                         const sizedbox(
//                           height: 16.0,
//                         ),
//                         _row(
//                             title: 'email', text: profileuser.user.email ?? ''),
//                         const sizedbox(
//                           height: 16.0,
//                         ),
//                         _row(
//                             title: 'phone', text: profileuser.user.phone ?? ''),
//                         const sizedbox(
//                           height: 16.0,
//                         ),
//                         _row(
//                             title: 'website',
//                             text: profileuser.user.website ?? ''),
//                         const sizedbox(
//                           height: 16.0,
//                         ),
//                       ])),
//             ],
//           ),
//           if (profileuser.address != null) ...[
//             row(
//               crossaxisalignment: crossaxisalignment.start,
//               mainaxisalignment: mainaxisalignment.start,
//               children: [
//                 const expanded(
//                   flex: 1,
//                   child: padding(
//                     padding: edgeinsets.only(top: 16.0, left: 16.0),
//                     child: text("address",
//                         style: textstyle(
//                             fontsize: 20,
//                             color: colors.white60,
//                             fontweight: fontweight.bold)),
//                   ),
//                 ),
//                 expanded(
//                   flex: 3,
//                   child: column(
//                     crossaxisalignment: crossaxisalignment.start,
//                     children: [
//                       const sizedbox(
//                         width: 200,
//                         child: divider(
//                           color: colors.white30,
//                         ),
//                       ),
//                       _row(
//                           title: 'street',
//                           text: profileuser.address!.street ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                       _row(
//                           title: 'suite',
//                           text: profileuser.address!.suite ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                       _row(
//                           title: 'zip-code',
//                           text: profileuser.address!.zipcode ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                       row(
//                         children: [
//                           sizedbox(
//                               width: 100,
//                               child: _row(
//                                   title: 'latitude',
//                                   text: profileuser.address!.lat ?? '')),
//                           sizedbox(
//                               width: 100,
//                               child: _row(
//                                   title: 'longitude',
//                                   text: profileuser.address!.lng ?? '')),
//                         ],
//                       ),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           if (profileuser.company != null) ...[
//             row(
//               crossaxisalignment: crossaxisalignment.start,
//               mainaxisalignment: mainaxisalignment.start,
//               children: [
//                 const expanded(
//                   flex: 1,
//                   child: padding(
//                     padding: edgeinsets.only(top: 16.0, left: 16.0),
//                     child: text("company",
//                         style: textstyle(
//                             fontsize: 20,
//                             color: colors.white60,
//                             fontweight: fontweight.bold)),
//                   ),
//                 ),
//                 expanded(
//                   flex: 3,
//                   child: column(
//                     crossaxisalignment: crossaxisalignment.start,
//                     children: [
//                       const sizedbox(
//                         width: 200,
//                         child: divider(
//                           color: colors.white30,
//                         ),
//                       ),
//                       _row(
//                           title: 'company-name',
//                           text: profileuser.company!.name ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                       _row(
//                           title: 'catch-phrase',
//                           text: profileuser.company!.catchphrase ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                       _row(title: 'bs', text: profileuser.company!.bs ?? ''),
//                       const sizedbox(
//                         height: 16.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ]
//         ],
//       ),
//     );
//   }
// }
//
// class _row extends statelesswidget {
//   const _row({
//     key? key,
//     required this.title,
//     required this.text,
//   }) : super(key: key);
//
//   final string title;
//   final string text;
//
//   @override
//   widget build(buildcontext context) {
//     return row(
//       mainaxissize: mainaxissize.min,
//       children: [
//         column(
//           crossaxisalignment: crossaxisalignment.start,
//           children: [
//             text(title,
//                 style: const textstyle(
//                     color: colors.white54,
//                     fontsize: 16.0,
//                     fontweight: fontweight.w400)),
//             const sizedbox(height: 4),
//             text(
//               text,
//               style: const textstyle(
//                   color: colors.white,
//                   fontsize: 20.0,
//                   fontweight: fontweight.w400),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
