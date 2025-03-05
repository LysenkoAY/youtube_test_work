import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_scrape_api/models/video.dart';

import '../bloc/search_bloc.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.video,
    required this.notifyDelete,
  });

  final Video video;
  final ValueNotifier<String> notifyDelete;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late ValueNotifier<bool?> onFavorite = ValueNotifier<bool?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<SearchBloc>().add(
            SearchEvent.checkFavorite(
              videoId: widget.video.videoId!,
              onCallBack: onFavorite,
            ),
          ),
    );
    widget.notifyDelete.addListener(() {
      if (widget.notifyDelete.value == widget.video.videoId) {
        onFavorite.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: onFavorite,
      builder: (context, value, child) {
        return value == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () => context.read<SearchBloc>().add(
                      SearchEvent.favorite(
                        video: widget.video,
                        onCallBack: onFavorite,
                      ),
                    ),
                icon: Icon(
                  value ? Icons.favorite : Icons.favorite_border,
                  size: Device.screenType == ScreenType.tablet ? 24 : 48,
                  color: Colors.redAccent,
                ),
              );
      },
    );
  }
}
