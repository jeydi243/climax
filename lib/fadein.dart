import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';


class FadeIn extends StatelessWidget {
	final double delay;
	final Widget child;

	FadeIn(this.delay, this.child);

	@override
	Widget build(BuildContext context) {
		final tween = MultiTrackTween([
			Track("opacity").add(
				Duration(milliseconds: 800), Tween(begin: 0.0, end: 1.0),
				curve: Curves.ease),
			Track("translateY").add(
				Duration(milliseconds: 800), Tween(begin: 30.0, end: 0.0),
				curve: Curves.ease)
		]);

		return ControlledAnimation(
			curve: Curves.easeInOut,
			delay: Duration(milliseconds: (300 * delay).round()),
			duration: tween.duration,
			tween: tween,
			child: child,
			builderWithChild: (context, child, animation) => Opacity(
				opacity: animation["opacity"],
				child: Transform.translate(
					offset: Offset(0, animation["translateY"]),
					child: child
				),
			),
		);
	}
}