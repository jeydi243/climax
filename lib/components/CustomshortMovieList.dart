import 'package:climax/Models/movie.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomshoMovieList extends StatefulWidget {
	CustomshoMovieList({
		Key key,
		@required this.moviesList
	}): super(key: key);
	final List < Movie > moviesList;
	@override
	_CustomshoMovieListState createState() => _CustomshoMovieListState();
}

class _CustomshoMovieListState extends State < CustomshoMovieList > {

	@override
	Widget build(BuildContext context) {
		MovieService service = Provider.of < MovieService > (context);
		return Container(
			height: 200,
			child: Row(
				children: < Widget > [
					Expanded(
						child: ListView.builder(
							scrollDirection: Axis.horizontal,
							physics: BouncingScrollPhysics(),
							itemCount: widget.moviesList.length,
							itemBuilder: (_, index) {
								return Padding(
								  padding: const EdgeInsets.all(5.0),
								  child: Column(
								  	children: < Widget > [
								  		Container(
								  			height: 100,
								  			child: ClipRRect(
								  				borderRadius: BorderRadius.circular(10.0),
								  				child: FadeInImage.memoryNetwork(
													fadeInCurve: Curves.easeInOutCirc,													  
								  					fit: BoxFit.cover,
								  					image: service.getImageUrl(widget.moviesList[index].posterPath),
								  					placeholder: kTransparentImage,
								  				),
								  			),
								  		),
								  		Text("${widget.moviesList[index].popularity}", style: GoogleFonts.lobster(
								  			fontSize: 15,
								  			color: Colors.amber
								  		))
								  	],
								  ),
								);
							},
						),
					),
				],
			),


		);
	}
}