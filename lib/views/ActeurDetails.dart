import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/services/person_service.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ActeurDetails extends StatefulWidget {
	ActeurDetails({
		Key key,
		@required this.personId
	}): super(key: key);
	final int personId;
	@override
	_ActeurDetailsState createState() => _ActeurDetailsState();
}

class _ActeurDetailsState extends State < ActeurDetails > {

	@override
	Widget build(BuildContext context) {
		PersonService personservice = Provider.of < PersonService > (context);
		MovieService movieservice = Provider.of < MovieService > (context);
		TMBDService tmm = Provider.of < TMBDService > (context);

		return Scaffold(
			body: SafeArea(
						  child: Stack(
			  	children: < Widget > [
			  		FutureBuilder(
			  			future: personservice.getDetails(widget.personId),
			  			builder: (context, snapshot) {
			  				if (snapshot.hasData) {
			  					return SizedBox(
			  						height: (MediaQuery.of(context).size.height / 2) - 20,
			  						width: MediaQuery.of(context).size.width,
			  						child: FadeInImage.memoryNetwork(
			  							fit: BoxFit.cover,
			  							placeholder: kTransparentImage,
			  							image: tmm.getImageUrl(snapshot.data['profile_path'],size: "Or")
			  						),
			  					);
			  				} else {
			  					return FadeInImage.memoryNetwork(
			  						placeholder: kTransparentImage,
			  						image: "https://via.placeholder.com/150",
			  						fit: BoxFit.cover,
			  					);
			  				}
			  			},
			  		),
			  		Align(
			  			alignment: Alignment(0, 1),
			  			child: ClipRRect(
			  				borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
			  				child: Container(
			  					height: MediaQuery.of(context).size.height / 2 + 40,
			  					width: MediaQuery.of(context).size.width,
			  					color: Pigment.fromString("#141E51"),
			  					child: Column(
			  						children: < Widget > [
			  							Expanded(
			  								child: ListView(
			  									physics: BouncingScrollPhysics(),
			  									children: < Widget > [
			  										Text("Le monde est beau")
			  									],
			  								),
			  							)
			  						],
			  					),
			  				),
			  			),
			  		)
			  	],
			  ),
			));
	}
}