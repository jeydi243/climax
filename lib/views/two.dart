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
		MovieServices result = Provider.of < MovieServices > (context, listen: false);

		return Container(
			height: 100,
			width: double.infinity,
			child: FutureBuilder(
				future: result.getLatestMovie(),
				builder: (_, snap) {
					return ListView.builder(
						itemCount: 1,
						scrollDirection: Axis.horizontal,
						shrinkWrap: true,
						itemBuilder: (BuildContext ctxt, int index) {
							dynamic daata = snap.data.keys.elementAt(12);
							return Container(
								height: 100,
								width: 90,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
									color: UniqueColorGenerator.getColor(),
									image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),fit: BoxFit.fill)
								),
								// child: Text("${snap.data['poster_path']}"),
								// Image.network("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",fit: BoxFit.fill),
							);


						}
					);
				},
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