import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:youtube_scrape_api/models/video.dart';
import 'package:youtube_test_work/features/search/widgets/video_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.searchingList,
    required this.searchController,
    required this.onSearch,
    required this.onClear,
    required this.pagingController,
    required this.onFavorite,
    required this.onDetail,
  });

  final ValueNotifier<List<String>> searchingList;
  final TextEditingController searchController;
  final Function(String value) onSearch;
  final Function() onClear;
  final PagingController<int, Video> pagingController;
  final Function(Video video) onFavorite;
  final Function(Video video) onDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PagingListener(
            controller: pagingController,
            builder: (context, state, fetchNextPage) => PagedListView<int, Video>.separated(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => VideoCard(
                  video: item,
                  onFavorite: onFavorite,
                  onDetail: onDetail,
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
              valueListenable: searchingList,
              builder: (context, list, child) => TypeAheadField<String>(
                controller: searchController,
                itemBuilder: (context, value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value),
                ),
                onSelected: (value) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onSearch(value);
                },
                suggestionsCallback: (value) => list,
                builder: (context, controller, focusNode) => Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CupertinoSearchTextField(
                    backgroundColor: Colors.white,
                    controller: controller,
                    focusNode: focusNode,
                    placeholder: 'Поиск',
                    onSuffixTap: onClear,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
