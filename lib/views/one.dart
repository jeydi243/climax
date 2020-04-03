import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';


class One extends StatefulWidget {
	One({
		Key key
	}): super(key: key);

	@override
	_OneState createState() => _OneState();
}

class _OneState extends State < One > {
	@override
	Widget build(BuildContext context) {
		return Container(
			height: double.infinity,
			width: double.infinity,
			child: FadeIn(.5,Text('One',
			style: TextStyle(
				color: Colors.white
			),)),
		);
	}
}