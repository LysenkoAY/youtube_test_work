part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _Loading;

  const factory SearchState.loaded({
    required TextEditingController searchController,
    required ValueNotifier<List<String>> searchingList,
    required PagingController<int, Video> pagingController
  }) = _Loaded;
}
