import 'package:flutter/material.dart';
import 'package:climax/views/home.dart';
import 'package:climax/backgroundvideo.dart';
import 'package:climax/views/accueil.dart';
import 'views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: Scaffold(
				body: SafeArea(
					child: Container(
						height: double.infinity,
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
				),
			)
		);
	}
}