import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class FadeIn extends StatelessWidget {
	final double delay;
	final Widget child;

	FadeIn(this.delay, this.child);

	@override
	Widget build(BuildContext context) {
		final tween = MultiTrackTween([
			Track("opacity").add(
				Duration(milliseconds: 1000), Tween(begin: 0.0, end: 1.0),
				curve: Curves.easeInCubic),
			Track("translateY").add(
				Duration(milliseconds: 1000), Tween(begin: 50.0, end: 0.0),
				curve: Curves.easeInCubic)
		]);

		return ControlledAnimation(
      curve: Curves.easeInCubic,
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