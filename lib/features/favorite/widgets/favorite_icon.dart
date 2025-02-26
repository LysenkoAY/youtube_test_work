import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_test_work/core/database/database.dart';

import '../bloc/favorite_bloc.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.video,
  });

  final VideoEntry video;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<FavoriteBloc>().add(FavoriteEvent.delete(widget.video)),
      icon: Icon(Icons.favorite, size: 48, color: Colors.redAccent),
    );
  }
}
