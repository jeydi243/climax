import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimy_card/slimy_card.dart';


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
		return ConstrainedBox(
			constraints: BoxConstraints(maxHeight: 200,maxWidth: 300,minHeight: 200,minWidth: 300),

			// padding: EdgeInsets.all(20),
			child: ListView.builder(
				itemCount: 5,
				scrollDirection: Axis.horizontal,
				shrinkWrap: true,
				itemBuilder: (BuildContext ctxt, int index) {
					return Card(
						child: Container(
							color: Colors.white,
							width: 100,
							height: 100,
							child: Text("Epa...$index"),
						),
					);
				},
			),
		);
	}
}