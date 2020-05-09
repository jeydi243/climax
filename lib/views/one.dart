import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class One extends StatefulWidget {
	One({
		Key key
	}): super(key: key);

	@override
	_OneState createState() => _OneState();
}

class _OneState extends State < One > {
	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of < MovieService > (context);

		return Container(
			height: 300,
			width: double.infinity,
			child: FutureBuilder<List<Map<String,dynamic>>>(
				future: result.getTrend2(),
				builder: (_, snap) {
					if (snap.hasData) {
						return ListView.builder(
							itemCount: snap.data.length,
							scrollDirection: Axis.horizontal,
							itemBuilder: (_, index) {
								return Image.network(result.getImageUrl(snap.data[index]["backdrop_path"]));
							},
						);
					} else {
						return Container(
							child: Text('Le Future ne remet rien! ',
								style: TextStyle(
									color: Colors.white
								),
							),
						);
					}
				},
			)
		);
	}
}