import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:youtube_scrape_api/models/video.dart';
import 'package:youtube_scrape_api/youtube_scrape_api.dart';

import '../../../core/database/drift_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.loading()) {
    on<_Initial>(_onInitial);
    on<_Search>(_onSearch);
    on<_Favorite>(_onFavorite);
    on<_Clear>(_onClear);

    searchController.addListener(
      () async {
        if (searchController.text.isNotEmpty) {
          searchString = searchController.text;
          searchingList.value = await youtubeDataApi.fetchSuggestions(searchController.text);
        } else {
          searchString = '';
        }
      },
    );

    pagingController = PagingController<int, Video>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) async => await youtubeDataApi.fetchSearchVideo(searchString),
    );
  }

  final TextEditingController searchController = TextEditingController();

  final YoutubeDataApi youtubeDataApi = YoutubeDataApi();

  ValueNotifier<List<String>> searchingList = ValueNotifier<List<String>>([]);

  late final PagingController<int, Video> pagingController;

  String searchString = '';

  final DriftRepository drift = GetIt.instance.get<DriftRepository>();

  void _onInitial(_Initial event, Emitter<SearchState> emit) async {
    emit(
      SearchState.loaded(
        searchController: searchController,
        searchingList: searchingList,
        pagingController: pagingController,
      ),
    );
  }

  void _onSearch(_Search event, Emitter<SearchState> emit) async {
    searchController.text = event.value;
    searchString = event.value;
    pagingController.refresh();
  }

  void _onFavorite(_Favorite event, Emitter<SearchState> emit) async {
    drift.insert(event.video, searchString);
  }

  void _onClear(_Clear event, Emitter<SearchState> emit) async {
    searchString = '';
    searchController.text = '';
    pagingController.refresh();
  }
}
