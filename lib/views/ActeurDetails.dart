import 'package:flutter/material.dart';


class ActeurDetails extends StatefulWidget {
	ActeurDetails({
		Key key,
		this.movieId
	}): super(key: key);
	int movieId;
	@override
	_ActeurDetailsState createState() => _ActeurDetailsState();
}

class _ActeurDetailsState extends State < ActeurDetails > {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea(
				child: Center(
					child: Text("${widget.movieId}"),
				),
			),
		);
	}
}