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
		
	}
}