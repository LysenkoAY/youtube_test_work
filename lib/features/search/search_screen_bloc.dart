import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_test_work/core/navigation/app_router.gr.dart';
import 'package:youtube_test_work/features/search/search_screen.dart';

import 'bloc/search_bloc.dart';

@RoutePage(name: "SearchShellScreenRoute")
class SearchShellScreen extends StatelessWidget {
  const SearchShellScreen({super.key});

  @override
  Widget build(context) => AutoRouter();
}

@RoutePage(name: "SearchScreenRoute")
class SearchScreenBloc extends StatelessWidget {
  const SearchScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc()..add(SearchEvent.initial()),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (searchController, searchingList, pagingController) => SearchScreen(
            searchController: searchController,
            searchingList: searchingList,
            onSearch: (value) => context.read<SearchBloc>().add(SearchEvent.search(value)),
            onClear: () => context.read<SearchBloc>().add(SearchEvent.clear()),
            pagingController: pagingController,
            onFavorite: (value) => context.read<SearchBloc>().add(SearchEvent.favorite(value)),
            onDetail: (video) => context.router.push(
              DetailScreenRoute(
                videoId: video.videoId!,
                title: video.title!,
                channelName: video.channelName!,
                views: video.views!,
              ),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
