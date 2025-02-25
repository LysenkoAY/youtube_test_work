// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:youtube_test_work/core/navigation/navigation_bar.dart' as _i3;
import 'package:youtube_test_work/features/detail/detail_screen.dart' as _i1;
import 'package:youtube_test_work/features/favorite/favorites_screen_bloc.dart'
    as _i2;
import 'package:youtube_test_work/features/search/search_screen_bloc.dart'
    as _i4;

/// generated route for
/// [_i1.DetailScreen]
class DetailScreenRoute extends _i5.PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    _i6.Key? key,
    required String videoId,
    required String title,
    required String channelName,
    required String views,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailScreenRoute.name,
         args: DetailScreenRouteArgs(
           key: key,
           videoId: videoId,
           title: title,
           channelName: channelName,
           views: views,
         ),
         initialChildren: children,
       );

  static const String name = 'DetailScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailScreenRouteArgs>();
      return _i1.DetailScreen(
        key: args.key,
        videoId: args.videoId,
        title: args.title,
        channelName: args.channelName,
        views: args.views,
      );
    },
  );
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.videoId,
    required this.title,
    required this.channelName,
    required this.views,
  });

  final _i6.Key? key;

  final String videoId;

  final String title;

  final String channelName;

  final String views;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, videoId: $videoId, title: $title, channelName: $channelName, views: $views}';
  }
}

/// generated route for
/// [_i2.FavoriteScreenBloc]
class FavoriteScreenRoute extends _i5.PageRouteInfo<void> {
  const FavoriteScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(FavoriteScreenRoute.name, initialChildren: children);

  static const String name = 'FavoriteScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoriteScreenBloc();
    },
  );
}

/// generated route for
/// [_i2.FavoriteShellScreen]
class FavoriteShellScreenRoute extends _i5.PageRouteInfo<void> {
  const FavoriteShellScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(FavoriteShellScreenRoute.name, initialChildren: children);

  static const String name = 'FavoriteShellScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoriteShellScreen();
    },
  );
}

/// generated route for
/// [_i3.NavigationBar]
class NavigationBarRoute extends _i5.PageRouteInfo<void> {
  const NavigationBarRoute({List<_i5.PageRouteInfo>? children})
    : super(NavigationBarRoute.name, initialChildren: children);

  static const String name = 'NavigationBarRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.NavigationBar();
    },
  );
}

/// generated route for
/// [_i4.SearchScreenBloc]
class SearchScreenRoute extends _i5.PageRouteInfo<void> {
  const SearchScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(SearchScreenRoute.name, initialChildren: children);

  static const String name = 'SearchScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SearchScreenBloc();
    },
  );
}

/// generated route for
/// [_i4.SearchShellScreen]
class SearchShellScreenRoute extends _i5.PageRouteInfo<void> {
  const SearchShellScreenRoute({List<_i5.PageRouteInfo>? children})
    : super(SearchShellScreenRoute.name, initialChildren: children);

  static const String name = 'SearchShellScreenRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SearchShellScreen();
    },
  );
}
