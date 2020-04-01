import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:slimy_card/slimy_card.dart';
// import 'package:pigment/pigment.dart';

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
	Color fromHex(String hexString) {
		return new Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CurvedNavigationBar(
				key: _bottomNavigationKey,
				backgroundColor: fromHex("141E51"),
				buttonBackgroundColor: fromHex("FFBA02"),
				animationCurve: Curves.ease,
				animationDuration: Duration(milliseconds: 200),
				color: fromHex("FDB096"),
				height: 65,
				items: < Widget > [
					Icon(Icons.add, size: 30,color: fromHex("200540")),
					Icon(Icons.local_movies, size: 30,color: fromHex("200540")),
					Icon(Icons.accessibility_new, size: 30,color: fromHex("200540")),
				],
				onTap: (index) {
					//Handle button tap
				},
			),
			body: Container(
				color: fromHex("141E51"),
				child: ListView(
					children: < Widget > [
						SlimyCard(
							color: Colors.red,
							width: 200,
							topCardHeight: 200,
							bottomCardHeight: 100,
							borderRadius: 15,
							topCardWidget: FittedBox(child: Image.asset("assets/roberto.jpg",fit: BoxFit.contain,)),
							bottomCardWidget: Text("Dolor amet quis minim ipsum sunt consequat ipsum ad commodo quis dolor eu Lorem Lorem. Ex veniam esse eiusmod esse deserunt sint cillum eiusmod laborum aliqua cupidatat. Non dolore laboris consequat sint sint aliqua amet mollit fugiat id duis elit. Officia ex dolor irure consequat. Veniam mollit nulla magna et culpa anim aliqua et adipisicing culpa est."),
							slimeEnabled: true,
						),
					],
				),
			),
		);
	}
}