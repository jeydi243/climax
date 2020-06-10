import 'dart:math';
import 'package:climax/Models/movie.dart';
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
	}
}
