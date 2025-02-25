part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initial() = _Initial;
  const factory SearchEvent.search(String value) = _Search;
  const factory SearchEvent.favorite(Video video) = _Favorite;
  const factory SearchEvent.clear() = _Clear;
}