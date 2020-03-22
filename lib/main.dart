import 'package:climax/views/home.dart';
import 'package:flutter/material.dart';
import 'package:climax/backgroundvideo.dart';
import 'package:climax/backgroundImage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: backgroundimage(),
		);
	}
}