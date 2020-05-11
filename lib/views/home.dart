import 'dart:ui'
as ui;
import 'package:climax/views/one.dart';
import 'package:climax/views/two.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';


class Home extends StatefulWidget {
	Home({
		Key key
	}): super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State < Home > {
	int _page = 1;
	GlobalKey _bottomNavigationKey = GlobalKey();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CurvedNavigationBar(
				key: _bottomNavigationKey,
				backgroundColor: Pigment.fromString("#141E51"), //Background color of selected
				buttonBackgroundColor: Pigment.fromString("#FFBA02"),
				animationCurve: Curves.ease,
				animationDuration: Duration(milliseconds: 200),
				color: Pigment.fromString("#FDB096"),
				height: 55,
				index: 1,
				items: < Widget > [
					Icon(Icons.add, size: 30, color: Pigment.fromString("200540")),
					Icon(Icons.local_movies, size: 30, color: Pigment.fromString("200540")),
					Icon(Icons.accessibility_new, size: 30, color: Pigment.fromString("200540")),
				],
				onTap: (index) {
					setState(() {
						_page = index;
					});
				},
			),
			body: SafeArea(
				child: Container(
					height: double.infinity,
					width: double.infinity,
					color: Pigment.fromString("#141E51"),
					padding: EdgeInsets.all(20),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: < Widget > [
							Text("Trend",
								style: GoogleFonts.dancingScript(
									color: Colors.amber,
									fontWeight: FontWeight.w600,
									fontSize: 20
								),
							),
							//Tabs(index: _page),
							Two(),
							//One(),
							// Text("data"),
						],
					)
				),
			),
		);
	}
}