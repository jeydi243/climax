import 'package:climax/components/acteurs.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';


class MovieScreen extends StatefulWidget {
	MovieScreen({
		Key key,
		@required this.movie
	}): super(key: key);
	final Map movie;

	@override
	_MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State < MovieScreen > {


	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of < MovieService > (context);

		return Scaffold(
			body: CustomScrollView(
				slivers: [
					SliverAppBar(
						actions: < Widget > [
							IconButton(
								icon: Icon(Icons.favorite,
									color: Colors.amber,
									size: 24.0, ),
								onPressed: null
							),
							IconButton(
								icon: Icon(
									Icons.more_vert,
									color: Colors.amber,
									size: 24.0,
								),
								onPressed: () {

								}
							)
						],
						// pinned: true,
						expandedHeight: 250.0,
						flexibleSpace: FlexibleSpaceBar(
							background: Hero(
								tag: widget.movie['id'],
								child: Image.network(widget.movie['images'] ?? "https://via.placeholder.com/150", fit : BoxFit.cover, )
							),

						),
					),

					SliverToBoxAdapter(
						child: Container(
							height: 600,
							padding: EdgeInsets.all(15.0),
							decoration: BoxDecoration(
								color: Pigment.fromString("#141E51"),
								borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
							),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: < Widget > [
									Column(
										children: < Widget > [
											Row(
												mainAxisAlignment: MainAxisAlignment.start,
												children: < Widget > [
													Text("Alita battle angel",
														style: GoogleFonts.courgette(
															color: Colors.amber,
															fontWeight: FontWeight.bold,
															fontSize: 25
														),
													),
												],
											),
											Row(
												mainAxisAlignment: MainAxisAlignment.start,
												children: [
													Icon(Icons.star, color: Colors.amber, ),
													Icon(Icons.star, color: Colors.amber, ),
													Icon(Icons.star, color: Colors.amber, ),
													Icon(Icons.star, color: Colors.amber, ),
													Icon(Icons.star, color: Colors.amber[100]),
													Text("8.9", style: GoogleFonts.courgette(
														color: Colors.blue,
														fontSize: 15,
														fontWeight: FontWeight.w700
													), )
												],
											),
										],
									),

									Row(
										children: < Widget > [
											Container(
												margin: EdgeInsets.only(left: 10.0),
												padding: EdgeInsets.all(5.0),
												decoration: BoxDecoration(
													color: Colors.amber,
													boxShadow: [BoxShadow(color: Colors.amber, spreadRadius: 1.0, blurRadius: 5.0, )],
													borderRadius: BorderRadius.all(Radius.circular(15.0)),
													border: new Border.all(
														color: Colors.green,
														width: .5,
														style: BorderStyle.none
													),
												), child: Text("Science-Fiction", style: TextStyle(
													color: Colors.white
												), )),
											Container(
												decoration: BoxDecoration(
													border: new Border.all(
														color: Colors.green,
														width: .5,
														style: BorderStyle.solid
													),
												), child: Text("Drame")),
											Container(
												decoration: BoxDecoration(
													border: new Border.all(
														color: Colors.green,
														width: .5,
														style: BorderStyle.solid
													),
												), child: Text("Action")),
										],
									),
									Column(
										mainAxisAlignment: MainAxisAlignment.start,
										crossAxisAlignment: CrossAxisAlignment.center,
										children: < Widget > [
											Text('Description', style: GoogleFonts.courgette(
													color: Colors.amber,
													fontWeight: FontWeight.w900,
													fontSize: 20
												),

											),
											Text("Aliquip minim irure exercitation enim nulla. Cillum nostrud labore occaecat ea duis aute consequat id laborum cupidatat quis reprehenderit sunt. Esse consequat cupidatat tempor elit irure enim fugiat. Ex exercitation sunt amet incididunt esse laborum cillum qui.",
												textAlign: TextAlign.justify,
												style: TextStyle(
													color: Colors.white
												),

											),
										],
									),

									Column(
										children: < Widget > [
											Row(
												children: < Widget > [
													Text('Acteurs', style: GoogleFonts.courgette(
														color: Colors.amber,
														fontWeight: FontWeight.w900,
														fontSize: 20
													), ),
													Spacer(),
													FlatButton(
														onPressed: () {

														},
														child: Text('Plus', style: TextStyle(
															color: Colors.amber
														), ),
													)
												],
											),

											Acteurs(movieId: widget.movie['id'])
										],
									),

								],
							)
						),
					),
				],
			),
		);
	}
}