part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.loading() = _Loading;

  const factory FavoriteState.loaded({
    required PagingController<int, VideoEntry> pagingController,
    required ValueNotifier<List<String>> searchingList,
  }) = _Loaded;
}
