import 'dart:math';
import 'dart:ui'
as ui;

import 'package:climax/Models/movie.dart';
import 'package:climax/components/tickettree.dart';
import 'package:climax/services/auth.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/login.dart';
import 'package:climax/views/movie_screen.dart';
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
		MovieService movieservice = Provider.of<MovieService>(context);
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
												child: One(context,movieservice),
											);
										} else if (_page == 1) {
											return Expanded(
												child: Two(context,movieservice),
											);
										} else {
											return Expanded(
												child: Three(context,movieservice)
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

	Widget One(BuildContext context, MovieService result){
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

	Widget Two(BuildContext context,MovieService result){
		return Container(
			height: 100,
			width: double.infinity,
			margin: EdgeInsets.only(top: 8),
			child: FutureBuilder < List < Movie >> (
				future: result.getTrend(),
				builder: (_, snap) {
					if (snap.hasData) {
						return ListView.builder(
							itemCount: snap.data.length,
							scrollDirection: Axis.horizontal,
							physics: BouncingScrollPhysics(),
							shrinkWrap: true,
							itemBuilder: (BuildContext ctxt, int index) {
								return Hero(
									tag: "${snap.data[index].id}",
									child: InkWell(
										onTap: () {
											Navigator.of(context).push(
												MaterialPageRoute(builder: (fd) => MovieScreen(movie: snap.data[index]))
											);
										},
										child: Container(
											height: 100,
											width: 80,
											margin: EdgeInsets.only(right: 8),
											decoration: BoxDecoration(
												borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
												// color: UniqueColorGenerator.getColor(),
												image: DecorationImage(image: NetworkImage(result.getImageUrl(snap.data[index].poster_path)), fit: BoxFit.fill)
											),
										),
									),
								);
							}
						);
					} else if (snap.hasError) {
						print("Future error: ${snap.error}");
						return Container(
							height: 100,
							width: 90,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
								// color: UniqueColorGenerator.getColor(),
								image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"), fit: BoxFit.fill)
							),

						);
					}
					return Container(color: UniqueColorGenerator.getColor(), width: 50, height: 50, );
				},
			)
		);
	}

	Widget Three(BuildContext context,MovieService result){
		return Container(
			height: double.infinity,
			width: double.infinity,
			child: TicketTree()
		);
	}
}

class UniqueColorGenerator {
	static Random random = new Random();
	static Color getColor() {
		return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
}