import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/navigation/app_router.gr.dart';
import 'bloc/favorite_bloc.dart';
import 'favorites_screen.dart';

@RoutePage(name: "FavoriteShellScreenRoute")
class FavoriteShellScreen extends StatelessWidget {
  const FavoriteShellScreen({super.key});

  @override
  Widget build(context) => AutoRouter();
}

@RoutePage(name: "FavoriteScreenRoute")
class FavoriteScreenBloc extends StatelessWidget {
  const FavoriteScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc()..add(FavoriteEvent.initial()),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (pagingController, searchingList) => FavoriteScreen(
            pagingController: pagingController,
            searchingList: searchingList,
            onSelect: (value) => context.read<FavoriteBloc>().add(FavoriteEvent.filter(value)),
            onDetail: (video) => context.router.push(
              DetailScreenRoute(
                videoId: video.videoId,
                title: video.title,
                channelName: video.channelName,
                views: video.views,
              ),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
