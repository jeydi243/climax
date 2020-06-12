import 'package:climax/services/movie_service.dart';
import 'package:climax/views/ActeurDetails.dart';
import 'package:flutter/material.dart';
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

		return Container(
			height: 100.0,
			width: double.maxFinite,
			child: FutureBuilder < Map < String, dynamic >> (
				future: result.getMovieCredits(widget.movieId),
				builder: (_, snap) {
					if (snap.hasData) {
						return ListView.builder(
							itemCount: snap.data['cast'].length,
							scrollDirection: Axis.horizontal,
							physics: BouncingScrollPhysics(),
							shrinkWrap: true,
							itemBuilder: (BuildContext ctxt, int index) {
								return GestureDetector(
									onTap: () {
										Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActeurDetails(movieId: widget.movieId)));
									},
									child: Padding(
										padding: const EdgeInsets.all(8.0),
											child: Container(
												height: 100,
												width: 100,
											  child: ClipRRect(
											  	//backgroundImage: NetworkImage(result.getImageUrl(snap.data['cast'][index]["profile_path"] ?? "https://via.placeholder.com/300")),
											  	child: FadeInImage.memoryNetwork(fit: BoxFit.cover, placeholder: kTransparentImage, image: result.getImageUrl(snap.data['cast'][index]["profile_path"])),
											  	borderRadius: BorderRadius.circular(10.0),
											  ),
											),
									)
								);
							}
						);
					}
					return Image.network(result.getImageUrl("https://via.placeholder.com/150"));
				},
			)
		);
	}
}