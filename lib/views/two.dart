import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';


class Two extends StatefulWidget {
	Two({
		Key key
	}): super(key: key);

	@override
	_TwoState createState() => _TwoState();
}

class _TwoState extends State < Two > {
	@override
	Widget build(BuildContext context) {
		return Container(
			height: double.infinity,
			width: double.infinity,
			// color: Colors.brown,
			child: FadeIn(.5, Text('Two',
				style: TextStyle(
					color: Colors.white
				), )),
		);
	}
}