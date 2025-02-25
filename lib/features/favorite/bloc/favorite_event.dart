part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.initial() = _Initial;
  const factory FavoriteEvent.filter(int filter) = _Filter;
  const factory FavoriteEvent.delete(VideoEntry video) = _Delete;
}