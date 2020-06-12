import 'package:climax/services/movie_service.dart';
import 'package:climax/views/ActeurDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
		MovieService result = Provider.of<MovieService> (context);

		return Container(
			height: 70.0,
			width: double.maxFinite,
			child: FutureBuilder<Map<String,dynamic>>(
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
									child: CircleAvatar(
										backgroundImage: NetworkImage(result.getImageUrl(snap.data['cast'][index]["profile_path"] ?? "https://via.placeholder.com/300")),
										// backgroundImage: NetworkImage("https://via.placeholder.com/150"),
										radius: 35.0,
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