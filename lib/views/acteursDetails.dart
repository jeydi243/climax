import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';


class ActeurDetails extends StatefulWidget {
	ActeurDetails({
		Key key,
		@required this.creditId
	}): super(key: key);
	final String creditId;
	@override
	_ActeurDetailsState createState() => _ActeurDetailsState();
}

class _ActeurDetailsState extends State < ActeurDetails > {
	@override
	Widget build(BuildContext context) {
		MovieService service = Provider.of(context);

		return Scaffold(
			body: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					SizedBox(
						height: (MediaQuery.of(context).size.height /2)-10,
						width: MediaQuery.of(context).size.width,
						child: FadeInImage.memoryNetwork(
							placeholder: kTransparentImage, 
							image: service.getImageUrl("")
							),
					)
				],
			),
		);
	}
}