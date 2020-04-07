import 'dart:math';

import 'package:climax/fadein.dart';
import 'package:climax/services/movie_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
		Map result = Provider.of<Map>(context);

		return Container(
			height: 90,
			width: double.infinity,
			child: ListView.builder(
				itemCount: result.length,
				scrollDirection: Axis.horizontal,
				shrinkWrap: true,
				itemBuilder: (BuildContext ctxt, int index) {
					String key = result.keys.elementAt(12);

					return Container(
						height: 90,
						width: 70,
						margin: EdgeInsets.only(left: 5, right: 5),
						decoration: BoxDecoration(
							borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
							color: UniqueColorGenerator.getColor(),
							// image: DecorationImage(image: NetworkImage("https://fluttercentral.com/Images/Logo.png"))
						),
						child: Text("$key"),

						// child: Text("dat222222a"),
					);


				}
			)
		);
	}
}

class UniqueColorGenerator {
	static Random random = new Random();
	static Color getColor() {
		return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
}