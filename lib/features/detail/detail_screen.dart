import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage(name: "DetailScreenRoute")
class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.videoId,
    required this.title,
    required this.channelName,
    required this.views,
  });

  final String videoId;
  final String title;
  final String channelName;
  final String views;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
          controlsVisibleAtStart: true,
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 32),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(widget.title, style: TextStyle(fontSize: 24)),
                const SizedBox(height: 16),
                Text(widget.channelName),
                const SizedBox(height: 16),
                Text(widget.views),
              ],
            ),
          ),

        ],
      )),
    );
  }
}
