import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';
import 'views/login.dart';class backgroundimage extends StatefulWidget {
	backgroundimage({
		Key key
	}): super(key: key);

	@override
	_backgroundimageState createState() => _backgroundimageState();
}

class _backgroundimageState extends State < backgroundimage > {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				child: Stack(
					alignment: AlignmentDirectional.center,
					fit: StackFit.loose,
					children: < Widget > [
						SizedBox.expand(
							child: FittedBox(
								fit: BoxFit.cover,
								child: Image.asset("assets/eber.jpg"),
							),
						), Container(
							padding: EdgeInsets.all(12.0),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.all(Radius.circular(12.0))
							),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: < Widget > [
									FadeIn(1, Container(
										width: 200,
										height: 50,
										color: Colors.red,
									)),
									LoginPage()
									,
									Column(
										children: < Widget > [
											FadeIn(4, SizedBox(
												width: MediaQuery.of(context).size.width,

												child: RaisedButton(onPressed: () {},
													animationDuration: Duration(milliseconds: 500),
													elevation: 12,
													shape: RoundedRectangleBorder(
														borderRadius: new BorderRadius.circular(18.0),
													),
													highlightColor: Colors.amber,
													splashColor: Colors.amber,
													color: Colors.amber,
													child: Text("Connexion"),
												),
											)),
											FadeIn(5, Row(
												children: < Widget > [
													Text('Vous etes nouveau?',
														style: TextStyle(color: Colors.white),
													),
													FlatButton(
														onPressed: () {},
														child: Text("Creer un compte",
															style: TextStyle(color: Colors.amber),
														)
													)
												],
											), )
										],
									)
								],
							),
						),

					],
				),
			),
		);
	}
}