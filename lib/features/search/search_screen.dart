import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_scrape_api/models/video.dart';
import 'package:youtube_test_work/features/search/widgets/video_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.searchingList,
    required this.searchController,
    required this.onSearch,
    required this.onClear,
    required this.pagingController,
    required this.onDetail,
    required this.notifyDelete,
  });

  final ValueNotifier<List<String>> searchingList;
  final TextEditingController searchController;
  final Function(String value) onSearch;
  final Function() onClear;
  final PagingController<int, Video> pagingController;
  final Function(Video video) onDetail;
  final ValueNotifier<String> notifyDelete;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool tablet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PagingListener(
            controller: widget.pagingController,
            builder: (context, state, fetchNextPage) => Device.screenType == ScreenType.tablet
                ? PagedGridView<int, Video>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          Device.screenType == ScreenType.tablet ? 350 : MediaQuery.of(context).size.width,
                      childAspectRatio: 16 / 9,
                      //crossAxisSpacing: 10,
                      //mainAxisSpacing: 10,
                      //crossAxisCount: 3,
                    ),
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => VideoCard(
                        video: item,
                        onDetail: widget.onDetail,
                        notifyDelete: widget.notifyDelete,
                      ),
                    ),
                  )
                : PagedListView<int, Video>.separated(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => VideoCard(
                        video: item,
                        onDetail: widget.onDetail,
                        notifyDelete: widget.notifyDelete,
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                  ),
          ),
          Positioned(
            top: 64,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.searchingList,
                  builder: (context, list, child) => Expanded(
                    child: TypeAheadField<String>(
                      controller: widget.searchController,
                      itemBuilder: (context, value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value),
                      ),
                      onSelected: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.onSearch(value);
                      },
                      suggestionsCallback: (value) => list,
                      builder: (context, controller, focusNode) => Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CupertinoSearchTextField(
                          backgroundColor: Colors.white70,
                          controller: controller,
                          focusNode: focusNode,
                          placeholder: 'Поиск',
                          onSuffixTap: widget.onClear,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => tablet = !tablet),
                  icon: Icon(tablet ? Icons.tablet_mac : Icons.phone_android, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
