import 'package:climax/components/tickettree.dart';
import 'package:climax/animations/fadein.dart';
import 'package:flutter/material.dart';


class Three extends StatefulWidget {
	Three({
		Key key
	}): super(key: key);

	@override
	_ThreeState createState() => _ThreeState();
}

class _ThreeState extends State < Three > {
	@override
	Widget build(BuildContext context) {
		return Container(
			height: double.infinity,
			width: double.infinity,
			child: FadeIn(.5, TicketTree()),
		);
	}
}