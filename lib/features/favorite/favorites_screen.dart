import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:youtube_test_work/features/favorite/bloc/favorite_bloc.dart';
import 'package:youtube_test_work/features/favorite/widgets/searches_selector.dart';
import 'package:youtube_test_work/features/favorite/widgets/video_card.dart';

import '../../core/database/database.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
    required this.pagingController,
    required this.onSelect,
    required this.searchingList,
    required this.onDetail,
    required this.onDelete,
  });

  final PagingController<int, VideoEntry> pagingController;
  final ValueNotifier<List<String>> searchingList;
  final Function(int search) onSelect;
  final Function(VideoEntry video) onDetail;
  final Function(VideoEntry video) onDelete;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PagingListener(
            controller: widget.pagingController,
            builder: (context, state, fetchNextPage) => PagedListView<int, VideoEntry>.separated(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => VideoCard(
                  video: item,
                  onDelete: widget.onDelete,
                  onDetail: widget.onDetail,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ),
          Positioned(
            top: 64,
            left: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: widget.searchingList,
              builder: (context, list, child) => SearchesSelector(list: list, onSelect: widget.onSelect),
            ),
          ),
        ],
      ),
    );
  }
}
