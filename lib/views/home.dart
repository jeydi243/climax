import 'dart:ui'
as ui;

import 'package:climax/services/auth.dart';
import 'package:climax/views/login.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';


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
		Auth auth = Provider.of(context);
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
				// child: Container(
				// 	height: double.infinity,
				// 	width: double.infinity,
				// 	color: Pigment.fromString("#141E51"),
				// 	padding: EdgeInsets.all(20),
				// 	child: Column(
				// 		crossAxisAlignment: CrossAxisAlignment.start,
				// 		children: < Widget > [
				// 			Text("Trend",
				// 				style: GoogleFonts.dancingScript(
				// 					color: Colors.amber,
				// 					fontWeight: FontWeight.w600,
				// 					fontSize: 20
				// 				),
				// 			),
				// 			//Tabs(index: _page),
				// 			Two(),
				// 			//One(),
				// 			// Text("data"),
				// 		],
				// 	)
				// ),
				child: Container(
					height: MediaQuery.of(context).size.height,
					width: MediaQuery.of(context).size.width,
					child: Padding(
						padding: EdgeInsets.all(10.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							children: < Widget > [
								Row(
									children: < Widget > [
										Padding(
											padding: EdgeInsets.only(
												top: MediaQuery.of(context).padding.top,
												left: 5,
												bottom: 10
											),
											child:IconButton(
													onPressed: () {

													}, 
													icon: Icon(FontAwesomeIcons.bars), color: Pigment.fromString("200540")),
										),
										Spacer(),
										Padding(
											padding: EdgeInsets.only(
												// top: MediaQuery.of(context).padding.top,
												right: 5,
												bottom: 10
											),
											child: GestureDetector(
												onTap: () async {
													await auth.signOut().then((value) {
														Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
													});
												},
												child: CircleAvatar(
													backgroundColor: Colors.amber,
													backgroundImage: NetworkImage("https://via.placeholder.com/150"),
												),
											),
										)
									],
								),
								Builder(
									builder: (context) {
										if (_page == 0) {
											return Expanded(
												child: One(context),
											);
										} else if (_page == 1) {
											return Expanded(
												child: Two(context),
											);
										} else {
											return Expanded(
												child: Three(context)
											);
										}
									},
								),
							],
						),
					),
				),
			),
		);
	}

	Widget One(BuildContext context){
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

	Widget Two(BuildContext context){

	}

	Widget Three(BuildContext context){

	}
}