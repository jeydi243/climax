import 'package:climax/services/movie_service.dart';
import 'package:climax/services/movie_service2.dart';
import 'package:climax/services/tmdb.dart';
import 'package:flutter/material.dart';
import 'package:climax/views/home.dart';
import 'package:climax/backgroundvideo.dart';
import 'package:climax/views/accueil.dart';
import 'package:provider/provider.dart';
import 'views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider<TMDBclass>(
					create:(_) => TMDBclass(),
					lazy: false,
					
				),
				ChangeNotifierProvider<MovieSer2>(
					create:(_) => new MovieSer2(),
					lazy: false,
				)
			],

			child: MaterialApp(
				title: 'Flutter Demo',
				debugShowCheckedModeBanner: false,
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
					),
			),
		);
	}
}