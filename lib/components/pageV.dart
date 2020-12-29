import 'package:climax/services/tmdb_service.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';


class PageV extends StatefulWidget {
	PageV({
		Key key,
	}): super(key: key);

	@override
	_PageVState createState() => _PageVState();
}

class _PageVState extends State < PageV > {
	PageController _controller;
	double myFraction = 0.8;
	double pageOffset = 0;
	String valeurBlur = "";

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
        TMBDService tmm = Provider.of<TMBDService>(context);
		return SizedBox(
			height: 350,
			child:FutureBuilder(
				future: mv.getPopular(),
				builder: (context, snap) {
					if (snap.hasData) {
						return PageView.builder(
									scrollDirection: Axis.horizontal,
									physics: BouncingScrollPhysics(),
									controller: _controller,
									itemCount: snap.data.length,
									itemBuilder: (context, index) {
										double scale = max(myFraction, (1 - (pageOffset - index).abs()) + myFraction);
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
																child: FadeInImage.memoryNetwork(
																	fit: BoxFit.cover,
																	image: tmm.getImageUrl(snap.data[index].posterPath),
																	placeholder: kTransparentImage,
																)
																// child: Image.network(tmm.getImageUrl(snap.data[index].posterPath), fit:BoxFit.cover),
															),
														),

													]
												),
											),
										);
									}
								);
					} else {
						return Container();
					}
				}
			),
		);
	}
}