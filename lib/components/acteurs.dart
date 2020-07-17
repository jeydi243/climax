import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/acteurDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Acteurs extends StatefulWidget {
	Acteurs({
		Key key,
		@required this.movieId
	}): super(key: key);
	final int movieId;

	@override
	_ActeursState createState() => _ActeursState();
}

class _ActeursState extends State < Acteurs > {
	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of < MovieService > (context);
		TMBDService tmm = Provider.of < TMBDService > (context);
		return Container(
			height: 100,
			child: FutureBuilder < List < Map < String, dynamic >>> (
				future: result.getMovieCredits(widget.movieId, "cast"),
				builder: (_, snap) {
					if (snap.hasData) {
						return ListView.builder(
							itemCount: snap.data.length,
							scrollDirection: Axis.horizontal,
							physics: BouncingScrollPhysics(),
							itemBuilder: (BuildContext ctxt, int index) {
								return GestureDetector(
									onTap: () {
										Get.to(ActeurDetails(personId: snap.data[index]['id'],),duration: Duration(milliseconds: 700));
									},
									child: Padding(
										padding: const EdgeInsets.all(5.0),
											child: Container(
												height: 100,
												width: 90,
												child: ClipRRect(
													borderRadius: BorderRadius.circular(10.0),
													child: FadeInImage.memoryNetwork(
														fit: BoxFit.cover,
														placeholder: kTransparentImage,
														image: tmm.getImageUrl(
															snap.data[index]["profile_path"]),
													)),
											),
									));
							});
					}
					return ListView.builder(
						itemCount: 10,
						itemBuilder: (BuildContext context, int index) {
							return Image.network("https://via.placeholder.com/150");
						},
					);
				},
			));
	}
}