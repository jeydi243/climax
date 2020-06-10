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
	FocusNode fsn;
	@override
	void initState() {
		// TODO: implement initState
		super.initState();
		fsn = FocusNode();
	}
	@override
	Widget build(BuildContext context) {
		Auth auth = Provider.of < Auth > (context);
		MovieService movieservice = Provider.of < MovieService > (context);


		return Scaffold(
			backgroundColor: Pigment.fromString("#141E51"),
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
					height: MediaQuery.of(context).size.height,
					width: double.infinity,
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						children: < Widget > [
							Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: < Widget > [
									IconButton(
										onPressed: () {

										},
										icon: Icon(FontAwesomeIcons.bars), color: Colors.amber),
									Row(
										children: < Widget > [
											Text("Climax", style: GoogleFonts.lobster(
												color: Colors.amber,
												fontWeight: FontWeight.bold,
												fontSize: 30
											), )
										],
									),
									Padding(
										padding: EdgeInsets.only(
											right: 5,
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
							Row(
								children: < Widget > [
									Expanded(
										child: Padding(
											padding: EdgeInsets.only(left: 15, right: 15),
											child: ClipRRect(
												borderRadius: BorderRadius.circular(25),
												child: Container(
													color: Colors.amber.withOpacity(0.2),
													child: TextFormField(
														cursorColor: Colors.amber,
														scrollPhysics: BouncingScrollPhysics(),
														
														style: TextStyle(
															color: Colors.amber[300],
														
														),
														
														decoration: InputDecoration(
															border: null,
															isDense: true,
															contentPadding: EdgeInsets.all(8),
															fillColor: Colors.amber[200],
															focusColor: Colors.amber[200],

														),
													),
												),
											),
										),
									)
								],
							),
							Builder(
								builder: (context) {
									if (_page == 0) {
										return Expanded(
											child: one(context, movieservice),
										);
									} else if (_page == 1) {
										return Expanded(
											child: two(context, movieservice),
										);
									} else {
										return Expanded(
											child: three(context, movieservice)
										);
									}
								},
							),
						],
					),
				),
			),
		);
	}

	Widget one(BuildContext context, MovieService result) {
		return Row(
			children: < Widget > [
				FutureBuilder < List < Map < String, dynamic >>> (
					future: result.getTrend2(),
					builder: (_, snap) {
						if (snap.hasData) {
							return Expanded(
								child: ListView.builder(
									itemCount: snap.data.length,
									scrollDirection: Axis.horizontal,
									itemBuilder: (_, index) {
										return Image.network(result.getImageUrl(snap.data[index]["backdrop_path"]));
									},
								),
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
				),
			],
		);
	}

	Widget two(BuildContext context, MovieService result) {
		return Row(
			children: < Widget > [
				FutureBuilder < List < Movie >> (
					future: result.getTrend(),
					builder: (_, snap) {
						if (snap.hasData) {
							return Expanded(
								child: SizedBox(
									height: 100,
									child: ListView.builder(
										itemCount: snap.data.length,
										scrollDirection: Axis.horizontal,
										physics: BouncingScrollPhysics(),
										shrinkWrap: true,
										itemBuilder: (BuildContext ctxt, int index) {
											return Hero(
												tag: "${snap.data[index].id}",
												child: GestureDetector(
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
									),
								),
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
				),
			],
		);
	}

	Widget three(BuildContext context, MovieService result) {
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