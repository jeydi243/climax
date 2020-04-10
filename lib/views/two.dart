import 'dart:math';

import 'package:climax/fadein.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:tmdb_dart/tmdb_dart.dart';


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
		MovieSer result = Provider.of < MovieSer > (context, listen: true);

		return Container(
			height: 100,
			width: double.infinity,
			margin: EdgeInsets.only(top: 8),
			child: FutureBuilder(
				future: result.getPopular(),
				builder: (_, snap) {
					if (snap.hasData) {
						print(snap.data.length);
						return ListView.builder(
							itemCount: snap.data.length ?? 2,
							scrollDirection: Axis.horizontal,
							shrinkWrap: true,
							itemBuilder: (BuildContext ctxt, int index) {
								// dynamic daata = snap.data.keys.elementAt(12);
								return Container(
									height: 100,
									width: 90,
									decoration: BoxDecoration(
										borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
										color: UniqueColorGenerator.getColor(),
										// image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),fit: BoxFit.fill)
									),
									child: Text("${snap.data.title} eppppap"),
									// Image.network("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",fit: BoxFit.fill),
								);


							}
						);
					} else if (!snap.hasData) {
						print(false);
						return Container(
							height: 100,
							width: 90,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
								color: UniqueColorGenerator.getColor(),
								image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),fit: BoxFit.fill)
							),
	
						);
					}else{
						print(snap.hasError);
						return Text("error: ${snap.hasError}");
					}
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