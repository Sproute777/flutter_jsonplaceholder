import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/album_cubit.dart';
import '../data/albums_api_client.dart';

class AlbumPage extends StatelessWidget {
  final String userId;
  const AlbumPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return BlocProvider(
    //   create: (context) => AlbumsCubit(AlbumsApiClient())..fetchAlbums(userId),
    //   child: const _AlbumView(),
    // );
  }
}
//
// class _AlbumView extends StatelessWidget {
//   const _AlbumView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AlbumsCubit, AlbumState>(
//         builder: (context, state) {
//           switch (state.status) {
//             case AlbumStatus.initial:
//               continue _initial;
//
//             case AlbumStatus.loading:
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//
//             case AlbumStatus.error:
//               return const Center(
//                 child: Text('something went wrong'),
//               );
//             case AlbumStatus.success:
//               return ListView.builder(
//                   primary: false,
//                   itemCount: state.albums.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(PhotoInfinityPage.route(
//                             state.albums[index].album.id));
//                       },
//                       child: Container(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 4),
//                           height: 50,
//                           color: Colors.blue[100],
//                           child: Row(
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Icon(Icons.collections_rounded),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   state.albums[index].album.title,
//                                   textAlign: TextAlign.center,
//                                   softWrap: true,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style:
//                                       Theme.of(context).textTheme.titleMedium,
//                                 ),
//                               ),
//                             ],
//                           )),
//                     );
//                   });
//             _initial:
//             default:
//               return const Center(
//                 child: Text('user have not album '),
//               );
//           }
//         },
//       ),
//     );
//   }
// }
