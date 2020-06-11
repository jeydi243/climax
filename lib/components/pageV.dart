import 'package:climax/services/movie_service.dart';
import 'package:climax/views/movie_screen.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:provider/provider.dart';


class PageV extends StatefulWidget {
	PageV({
		Key key,
	}): super(key: key);

	@override
	_PageVState createState() => _PageVState();
}

class _PageVState extends State < PageV > {
	PageController _controller;
	String _name;
	double myFraction = 0.8;
	double pageOffset = 0;
	String valeurBlur = "";
	Map < String,
	String > _list = {
		"Rexton": "assets/eber.jpg",
		"Audi": "assets/deux.jpg",
		"Nissan Bus": "assets/roberto.jpg",
		"Nissan camionette": "assets/un.jpg"
	};

	@override
	void initState() {
		super.initState();
		_controller = new PageController(viewportFraction: myFraction)..addListener(() {
			setState(() {
				pageOffset = _controller.page;
			});
		});
	}
	@override
	void dispose() {
		super.dispose();
		_controller.dispose();
	}

	@override
	Widget build(BuildContext context) {
		MovieService mv = Provider.of < MovieService > (context);
		return SizedBox(
			height: 350,
			child: Row(
				children: < Widget > [
					Expanded(
						child: FutureBuilder(
							future: mv.getPopular(),
							builder: (context, snap) {
								if (snap.hasData) {
									return PageView.builder(
										physics: BouncingScrollPhysics(),
										controller: _controller,
										itemCount: snap.data.length,
										itemBuilder: (context, index) {
											double scale = max(myFraction, (1 - (pageOffset - index).abs()) + myFraction);
											_name = _list[index];
											return Container(
												height: 80.0,
												padding: EdgeInsets.only(
													right: 20.0,
													top: 50 - scale * 25,

												),
												child: ClipRRect(
													borderRadius: BorderRadius.circular(20.0),
													child: Stack(
														children: [
															SizedBox(
																height: double.infinity,
																child: GestureDetector(
																	onTap: () {
																		Navigator.of(context).push(
																			MaterialPageRoute(builder: (fd) => MovieScreen(movie: snap.data[index]))
																		);
																	},
																	child: Image.network(mv.getImageUrl(snap.data[index].poster_path), fit:BoxFit.cover),
																),
															),

														]
													),
												),
												// child: Image.asset(_list[index]),
											);
										}
									);
								} else {
									return Container();
								}

							}
						),
					),
				],
			),
		);
	}
}