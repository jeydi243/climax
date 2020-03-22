import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';
import 'views/login.dart';

class backgroundimage extends StatefulWidget {
	backgroundimage({
		Key key
	}): super(key: key);

	@override
	_backgroundimageState createState() => _backgroundimageState();
}

class _backgroundimageState extends State < backgroundimage > {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				child: Stack(
					alignment: AlignmentDirectional.center,
					fit: StackFit.loose,
					children: < Widget > [
						SizedBox.expand(
							child: FittedBox(
								fit: BoxFit.cover,
								child: Image.asset("assets/eber.jpg"),
							),
						),
						LoginPage(),
					],
				),
			),
		);
	}
}