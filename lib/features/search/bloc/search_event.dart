part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initial() = _Initial;

  const factory SearchEvent.search(String value) = _Search;

  const factory SearchEvent.favorite({
    required Video video,
    required ValueNotifier<bool?> onCallBack,
  }) = _Favorite;

  const factory SearchEvent.checkFavorite({
    required String videoId,
    required ValueNotifier<bool?> onCallBack,
  }) = _CheckFavorite;

  const factory SearchEvent.clear() = _Clear;
}
