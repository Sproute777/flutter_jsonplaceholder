// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../features/allusers/view/allusers_page.dart';
// import '../models/models.dart';
// import '../widgets/profile_tabs_bar.dart';

// GoRouter appRouter() => GoRouter(
//       routes: <GoRoute>[
//         GoRoute(
//           path: '/',
//           builder: (BuildContext context, GoRouterState state) =>
//               const AllusersPage(),
//         ),
//         GoRoute(
//             path: '/tab-bar',
//             builder: (BuildContext context, GoRouterState state) {
//               final Map<String, Object> params =
//                   state.extra! as Map<String, Object>;
//               final ProfileUser profileUser =
//                   params['profileUser']! as ProfileUser;
//               return ProfileTabBar(user: profileUser);
//             }),
//       //          GoRoute(
//       //   path: '/profile',
//       //   redirect: (_) => '/books/popular',
//       // ),
//       GoRoute(
//         path: '/profile/:userId',
//         redirect: (GoRouterState state) =>
//             '/books/all/${state.params['bookId']}',
//       ),
//       GoRoute(
//         path: '/profile/:kind(user|albums|posts)',
//         pageBuilder: (BuildContext context, GoRouterState state) =>
//             FadeTransitionPage(
//           key: _scaffoldKey,
//           child: BookstoreScaffold(
//             selectedTab: ScaffoldTab.books,
//             child: BooksScreen(state.params['kind']!),
//           ),
//         ),
//         routes: <GoRoute>[
//           GoRoute(
//             path: ':bookId',
//             builder: (BuildContext context, GoRouterState state) {
//               final String bookId = state.params['bookId']!;
//               final Book? selectedBook = libraryInstance.allBooks
//                   .firstWhereOrNull((Book b) => b.id.toString() == bookId);

//               return BookDetailsScreen(book: selectedBook);
//             },
//           ),
//         ],
//       ), 
//       ],
      
//     );



// /// A page that fades in an out.
// class FadeTransitionPage extends CustomTransitionPage<void> {
//   /// Creates a [FadeTransitionPage].
//   FadeTransitionPage({
//     required LocalKey key,
//     required Widget child,
//   }) : super(
//             key: key,
//             transitionsBuilder: (BuildContext context,
//                     Animation<double> animation,
//                     Animation<double> secondaryAnimation,
//                     Widget child) =>
//                 FadeTransition(
//                   opacity: animation.drive(_curveTween),
//                   child: child,
//                 ),
//             child: child);

//   static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
// }