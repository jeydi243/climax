import 'package:flutter/material.dart';
import 'login.dart';

// ignore: camel_case_types
class accueil extends StatefulWidget {
	accueil({
		Key key
	}): super(key: key);

	@override
	_accueilState createState() => _accueilState();
}

class _accueilState extends State < accueil > {
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
						),
						LoginPage(),
					],
				),
			),
		);
	}
}