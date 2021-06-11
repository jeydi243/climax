import 'package:chewie/chewie.dart';
import 'package:climax/models/movie.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ListVideos extends StatefulWidget {
  ListVideos({Key key, @required this.movie}) : super(key: key);

  final Movie movie;
  VideoPlayerController controller;

  @override
  _ListVideosState createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideos> {
  ChewieController _chewie;
  @override
  void initState() {
    super.initState();
    _chewie = ChewieController(
        videoPlayerController: widget.controller,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MovieService result = Provider.of<MovieService>(context);
    return Container(
        height: 100,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) {
            return Container(
              child: VideoPlayer(null),
            );
          },
        ));
  }
}
