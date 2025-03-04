import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_scrape_api/models/video.dart';

import '../../widgets/rotation_card.dart';
import 'favorite_icon.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.video,
    required this.onDetail,
    required this.notifyDelete,
  });

  final Video video;
  final Function(Video video) onDetail;
  final ValueNotifier<String> notifyDelete;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final height =
          video.thumbnails![0].height!.toDouble() / video.thumbnails![0].width!.toDouble() * constraints.maxWidth;
      return RotationCard(
        onTap: () => onDetail(video),
        front: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              //height: height,
              //width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: Image.network(video.thumbnails![0].url!).image, fit: BoxFit.cover),
              ),
            ),
            FavoriteIcon(video: video, notifyDelete: notifyDelete),
          ],
        ),
        back: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              //height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white.withValues(alpha: 0.2), BlendMode.dstATop),
                  image: Image.network(video.thumbnails![0].url!).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AutoSizeText(
                      video.title!,
                      style: TextStyle(fontSize: Device.screenType == ScreenType.tablet ? 12 : 24),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      video.channelName!,
                      style: TextStyle(fontSize: Device.screenType == ScreenType.tablet ? 8 : 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    AutoSizeText(
                      video.views!,
                      style: TextStyle(fontSize: Device.screenType == ScreenType.tablet ? 8 : 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            FavoriteIcon(video: video, notifyDelete: notifyDelete),
          ],
        ),
      );
    });
  }
}

//https://medium.com/@ximya/get-dynamic-widget-size-in-flutter-f3e12c52ce1f
