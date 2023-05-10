import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_repository/json_repository.dart';

import '../bloc/infinity_list_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/photo_list_item.dart';

class InfinityListPage extends StatelessWidget {
  const InfinityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InfinityList')),
      body: BlocProvider(
        create: (_) =>
            InfinityListBloc(RepositoryProvider.of<JsonRepository>(context))
              ..add((const FetchInfinityListRequest())),
        child: const InfinityListList(),
      ),
    );
  }
}

class InfinityListList extends StatefulWidget {
  const InfinityListList({super.key});

  @override
  State<InfinityListList> createState() => _InfinityListListState();
}

class _InfinityListListState extends State<InfinityListList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfinityListBloc, InfinityListState>(
      builder: (context, state) {
        switch (state.status) {
          case InfinityListStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case InfinityListStatus.loading:
          case InfinityListStatus.loaded:
            if (state.photos.isEmpty) {
              return const Center(child: Text('no photos'));
            }
            debugPrint('----total photos --${state.photos.length}');
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.photos.length
                    ? const BottomLoader()
                    : PhotoListItem(photo: state.photos[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.photos.length
                  : state.photos.length + 1,
              controller: _scrollController,
            );
          case InfinityListStatus.init:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<InfinityListBloc>().add(const FetchInfinityListRequest());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll - screenHeight;
  }
}
