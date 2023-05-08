// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/photos_bloc.dart';
// import '../data/photos_api_client.dart';
// import '../widgets/photo_item.dart';
// import '../widgets/photo_loader.dart';
//
// class PhotoInfinityPage extends StatelessWidget {
//   static Route route(int albumId) {
//     return MaterialPageRoute<void>(
//         builder: (_) => PhotoInfinityPage(albumId: albumId));
//   }
//
//   const PhotoInfinityPage({Key? key, required this.albumId}) : super(key: key);
//   final int albumId;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           PhotosBloc(albumId, PhotosApiClient())..add(PhotosFetched()),
//       child: const _PhotoInfinityView(),
//     );
//   }
// }
//
// class _PhotoInfinityView extends StatefulWidget {
//   const _PhotoInfinityView({Key? key}) : super(key: key);
//
//   @override
//   State<_PhotoInfinityView> createState() => _PhotoInfinityViewState();
// }
//
// class _PhotoInfinityViewState extends State<_PhotoInfinityView> {
//   final _scrollController = ScrollController();
//   late final double _screenHeight;
//   final _expandedIndices = <int>{};
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _screenHeight = MediaQuery.of(context).size.height;
//     return BlocBuilder<PhotosBloc, PhotosState>(
//       builder: (context, state) {
//         switch (state.status) {
//           case PhotosStatus.failure:
//             return const Center(child: Text('failed to fetch posts'));
//           case PhotosStatus.success:
//             if (state.photos.isEmpty) {
//               return const Center(child: Text('no photos'));
//             }
//
//             return GridView.builder(
//               padding: const EdgeInsets.all(32),
//               itemCount: state.hasReachedMax
//                   ? state.photos.length
//                   : state.photos.length + 3,
//               controller: _scrollController,
//               itemBuilder: (context, index) => index >= state.photos.length
//                   ? const BottomLoader()
//                   : PhotoItem(
//                       photo: state.photos[index],
//                       onTap: () => setState(() =>
//                           _expandedIndices.contains(index)
//                               ? _expandedIndices.remove(index)
//                               : _expandedIndices.add(index)),
//                     ),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 16.0,
//                 crossAxisSpacing: 16.0,
//               ),
//             );
//
//           default:
//             return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }
//
//   void _onScroll() {
//     if (_isBottom) context.read<PhotosBloc>().add(PhotosFetched());
//   }
//
// // при таком порядке загрузит только доплнительный экран про запас
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return (maxScroll - currentScroll) < (_screenHeight);
//   }
// }
