import 'package:flutter/material.dart';
import 'package:youtube_test_work/core/database/database.dart';

import '../../widgets/rotation_card.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.video,
    required this.onDelete,
    required this.onDetail,
  });

  final VideoEntry video;
  final Function(VideoEntry video) onDelete;
  final Function(VideoEntry video) onDetail;

  @override
  Widget build(BuildContext context) {
    return RotationCard(
      onTap: () => onDetail(video),
      front: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: (MediaQuery.of(context).size.width / 4) * 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: Image.network(video.url).image, fit: BoxFit.cover),
            ),
          ),
          IconButton(
              onPressed: () {
                onDelete(video);
              },
              icon: Icon(Icons.favorite, size: 48, color: Colors.redAccent)),
        ],
      ),
      back: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: (MediaQuery.of(context).size.width / 4) * 3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(video.title, style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  Text(video.channelName),
                  const SizedBox(height: 16),
                  Text(video.views),
                ],
              ),
            ),
          ),
          IconButton(onPressed: () => onDelete(video), icon: Icon(Icons.favorite, size: 48, color: Colors.redAccent)),
        ],
      ),
    );
  }
}
