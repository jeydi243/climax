import 'package:climax/Models/movie.dart';
import 'package:climax/components/acteurs.dart';
import 'package:climax/components/genre.dart';
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
	final Movie movie;

	@override
	_MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State < MovieScreen > {


	@override
	Widget build(BuildContext context) {
		MovieService result = Provider.of < MovieService > (context);

		return Scaffold(
			body: CustomScrollView(
				shrinkWrap: true,
				slivers: [
					SliverAppBar(
						floating: false,
						actions: < Widget > [
							IconButton(
								icon: Icon(Icons.favorite,
									color: Colors.amber,
									size: 24.0, ),
								onPressed: null
							),
							Builder(
								builder: (contextx) {
									return IconButton(
										icon: Icon(
											Icons.more_vert,
											color: Colors.amber,
											size: 24.0,
										),
										onPressed: () {
											Scaffold.of(contextx).showSnackBar(
												SnackBar(
													elevation: 10.0,
													content: Text("${result.language}"),
												)
											);
										}
									);
								}
							)
						],
						expandedHeight: 250.0,
						flexibleSpace: FlexibleSpaceBar(

							background: GestureDetector(
								onVerticalDragEnd: (gf) {
									Navigator.pop(context);
								},
								child: Stack(
									children: [
										Hero(
											tag: "${widget.movie.id}",
											child: SizedBox(width: double.infinity, height: double.infinity, child: Image.network(result.getImageUrl(widget.movie.poster_path) ?? "https://via.placeholder.com/150", fit : BoxFit.cover, ))
										),
										Align(
											alignment: Alignment(0, 1),
											child: Container(
												width: double.infinity,
												height: 50,
												decoration: BoxDecoration(
													gradient: LinearGradient(
														begin: Alignment(0, 1),
														end: Alignment(0, -1),
														colors: [Pigment.fromString("#141E51"), Pigment.fromString("#141E51").withOpacity(0.2), Colors.transparent])
												),
											),
										),


									]
								),
							),

						),
					),
					SliverToBoxAdapter(
						child: Container(
							height: 600,
							padding: EdgeInsets.all(15.0),
							decoration: BoxDecoration(
								color: Pigment.fromString("#141E51"),
								// borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
							),
							child: Column(
								children: < Widget > [
									Padding(
										padding: EdgeInsets.only(bottom: 10.0),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.start,
											children: < Widget > [
												Text("${widget.movie.title}",
													style: GoogleFonts.courgette(
														color: Colors.amber,
														fontWeight: FontWeight.bold,
														fontSize: 23
													),
												),
											],
										),
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.start,
										children: [
											Icon(Icons.star, color: Colors.amber, ),
											Icon(Icons.star, color: Colors.amber, ),
											Icon(Icons.star, color: Colors.amber, ),
											Icon(Icons.star, color: Colors.amber, ),
											Icon(Icons.star, color: Colors.amber[100]),
											Padding(
												padding: EdgeInsets.only(left: 10.0),
												child: Container(
													decoration: BoxDecoration(
														color: Colors.amberAccent.withOpacity(0.3),
														border: Border(
															left: BorderSide(
																color: Colors.amber,
																style: BorderStyle.solid,
																width: 2.0
															)
														)
													),
													child: Padding(
														padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
														child: Text("${widget.movie.vote_average}", style: GoogleFonts.courgette(
															color: Colors.blue,
															fontSize: 15,
															fontWeight: FontWeight.w700
														), ),
													),
												),
											)
										],
									),

									Padding(
										padding: EdgeInsets.only(bottom: 35.0),
										child: Container(
											height: 35,
											child: Genre(genres: widget.movie.genres)),
									),
									Column(
										mainAxisAlignment: MainAxisAlignment.start,
										crossAxisAlignment: CrossAxisAlignment.center,
										children: < Widget > [
											Padding(
												padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
												child: Row(
													children: < Widget > [
														Text('Description', style: GoogleFonts.courgette(
															color: Colors.amber,
															fontWeight: FontWeight.w900,
															fontSize: 20
														), ),
													],
												),
											),
											Padding(
												padding: EdgeInsets.only(bottom: 10.0),
												child: Text("${widget.movie.overview}",
													textAlign: TextAlign.justify,
													style: TextStyle(
														color: Colors.white
													),
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

											Acteurs(movieId: widget.movie.id)
										],
									),
									Row(
										children: < Widget > [

										],
									)
								],
							)
						),
					),
				],
			),
		);
	}
}