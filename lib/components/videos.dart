import 'package:chewie/chewie.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


class ListVideos extends StatefulWidget {
	ListVideos({
		Key key, @required this.movieId
	}): super(key: key);

	final int movieId;
	VideoPlayerController controller;

	@override
	_ListVideosState createState() => _ListVideosState();
}

class _ListVideosState extends State < ListVideos > {
	ChewieController _chewie;
	@override
  void initState() {
    super.initState();
	_chewie = ChewieController(
		videoPlayerController: widget.controller,
		aspectRatio: 16/9,
		autoInitialize: true,
		looping: false,
		errorBuilder: (context,errorMessage){
			return Center(
				child: Text(errorMessage),
			);
		}
		
	);
  }
	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of<MovieService>(context);
		return Container(
			height: 100,
			child: FutureBuilder(
				future: result.getVideos(widget.movieId),
				builder: (_, snap) {
					return ListView.builder(
						itemCount: 10,
						scrollDirection: Axis.horizontal,
						itemBuilder: (_, int index) {
							if (snap.hasData) {
								return Container(
									child: VideoPlayer(null),
								);
							}
						},
					);
				}
			),
		);
	}
}