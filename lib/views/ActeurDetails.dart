import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/services/person_service.dart';
import 'package:flutter/material.dart';
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
	void initState() {
		super.initState();
		getpersonDetails();
	}

	Future < void > getpersonDetails() async {
		PersonService personservice = Provider.of < PersonService > (context);
	}

	@override
	Widget build(BuildContext context) {
		PersonService personservice = Provider.of < PersonService > (context);
		MovieService movieservice = Provider.of < MovieService > (context);
		TMBDService tmm = Provider.of < TMBDService > (context);

		return Scaffold(
			body: Stack(
				fit: StackFit.expand,
				children: < Widget > [
					SizedBox(
						height: (MediaQuery.of(context).size.height / 2) - 10,
						width: MediaQuery.of(context).size.width,
						child: FadeInImage.memoryNetwork(
							placeholder: kTransparentImage,
							image: tmm.getImageUrl("")),
					)
				],
			));
	}
}