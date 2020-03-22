import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BackgroundVideo extends StatefulWidget {
	BackgroundVideo({
		Key key
	}): super(key: key);

	@override
	_BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State < BackgroundVideo > {
	VideoPlayerController _controller;
	@override
	void dispose() {
		super.dispose();
		_controller.dispose();
	}
	@override
	void initState() {
		super.initState();
		_controller = VideoPlayerController.asset("assets/background.mp4")..initialize().then((_) {
			// Once the video has been loaded we play the video and set looping to true.
			_controller.seekTo(Duration(seconds: 50)).then((onValue){
				_controller.play();
				_controller.setLooping(true);
			});
			// Ensure the first frame is shown after the video is initialized.
			setState(() {});
		});
	}
	@override
	Widget build(BuildContext context) {
		return SafeArea(
			child: Scaffold(
				body: Stack(
					alignment: AlignmentDirectional.center,
					children: < Widget > [
						SizedBox.expand(
							child: FittedBox(
								fit: BoxFit.cover,
								child: SizedBox(
									width: _controller.value.size ?.width ?? 0,
									height : _controller.value.size ?.height ?? 0,
									child : VideoPlayer(_controller),
								),
							),
						),
						RotateAnimatedTextKit(
							isRepeatingAnimation: true,
							onTap: () {
								print("Tap Event");
							},
							text: ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
							textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon", color: Colors.yellow),
							textAlign: TextAlign.start,
							alignment: AlignmentDirectional.topStart // or Alignment.topLeft
						),
					],
				),
			)
		);
	}
}