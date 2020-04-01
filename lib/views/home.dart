import 'package:flutter/material.dart';
import 'package:climax/components/ticketone.dart';
import 'package:climax/components/tickettwo.dart';
import 'package:climax/components/tickettree.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:pigment/pigment.dart';

class Home extends StatefulWidget {
	Home({
		Key key
	}): super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State < Home > {
	int _page = 0;
	GlobalKey _bottomNavigationKey = GlobalKey();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CurvedNavigationBar(
				key: _bottomNavigationKey,
				backgroundColor: Pigment.fromString("#141E51"),
				buttonBackgroundColor: Pigment.fromString("#FFBA02"),
				animationCurve: Curves.ease,
				animationDuration: Duration(milliseconds: 200),
				color: Pigment.fromString("#FDB096"),
				height: 65,
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
					color: Pigment.fromString("#141E51"),
					child: Column(
						children: < Widget > [
							TicketTree(titre: "Le monde est beau !", madate: DateTime.now().toString(), ),
						],
					)
					//TicketOne(),
					//TicketTwo(),
				),
			),
		);
	}
}