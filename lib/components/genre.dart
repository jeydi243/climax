import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Genre extends StatefulWidget {
	Genre({
		Key key,@required this.genres
	}): super(key: key);
	final List<int> genres;
	@override
	_GenreState createState() => _GenreState();
}

class _GenreState extends State < Genre > {
	@override
	Widget build(BuildContext context) {
	MovieService result = Provider.of < MovieService >(context);

		return Container(
			// height: 50,
			width: double.infinity,
			margin: EdgeInsets.only(top: 8),
			child: FutureBuilder < List < String >> (
				future: result.getGenreById(widget.genres),
				builder: (context, snap) {
					if (snap.hasData) {
						return ListView.builder(
							shrinkWrap: true,
							itemCount: snap.data.length,
							scrollDirection: Axis.horizontal,
							itemBuilder: (_, int index) {
								return Container(
									margin: EdgeInsets.only(left: 10.0),
									padding: EdgeInsets.all(5.0),
									decoration: BoxDecoration(
										color: Colors.amber,
										boxShadow: [BoxShadow(color: Colors.amber, spreadRadius: 1.0, blurRadius: 5.0, )],
										borderRadius: BorderRadius.all(Radius.circular(15.0)),
										border: new Border.all(
											color: Colors.green,
											width: .5,
											style: BorderStyle.none
										),
									),
									child: Text(snap.data[index], style: TextStyle(
										color: Colors.white
									), ),
								);
							},
						);
					} else if (snap.hasError) {
						return Text("${snap.error}");
					} else {
						return Container();
					}
				},
			), 
		);
	}
}