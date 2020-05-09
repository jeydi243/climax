import 'dart:math';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Two extends StatefulWidget {
	Two({
		Key key
	});

	@override
	_TwoState createState() => _TwoState();
}

class _TwoState extends State < Two > {

	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of < MovieService > (context);

		return Container(
			height: 100,
			width: double.infinity,
			margin: EdgeInsets.only(top: 8),
			child: FutureBuilder(
				future: result.getTrend(),
				builder: (_, snap) {
					if (snap.hasData) {
						return ListView.builder(
							itemCount: snap.data['results'].length,
							scrollDirection: Axis.horizontal,
							physics: BouncingScrollPhysics(),
							shrinkWrap: true,
							itemBuilder: (BuildContext ctxt, int index) {
								return Hero(
									tag: snap.data["results"][index]['id'],
									child: InkWell(
										onTap: () {
											Navigator.of(context).push(
												MaterialPageRoute(builder: (fd) => MovieScreen(movie: {
													"id": snap.data["results"][index]['id'],
													"images": result.getImageUrl(snap.data["results"][index]["poster_path"])
												}))
											);
										},
										child: Container(
											height: 100,
											width: 80,
											margin: EdgeInsets.only(right: 8),
											decoration: BoxDecoration(
												borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
												// color: UniqueColorGenerator.getColor(),
												image: DecorationImage(image: NetworkImage(result.getImageUrl(snap.data["results"][index]["poster_path"])), fit: BoxFit.fill)
											),
										),
									),
								);
							}
						);
					} else if (!snap.hasData) {
						print(snap.hasData);
						return Container(
							height: 100,
							width: 90,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
								color: UniqueColorGenerator.getColor(),
								image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"), fit: BoxFit.fill)
							),

						);
					} else {
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