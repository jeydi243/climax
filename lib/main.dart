import 'package:climax/services/movie_service.dart';
import 'package:climax/services/tmdb.dart';
import 'package:climax/translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider < TMDBclass > (
					create: (_) => TMDBclass(),
					lazy: false,
				),
				ChangeNotifierProvider < MovieService > (
					create: (_) => new MovieService(),
					lazy: false,
				)
			],

			child: MaterialApp(
				localizationsDelegates: [
					GlobalMaterialLocalizations.delegate,
					GlobalWidgetsLocalizations.delegate,
					const TranslationsDelegate(),
				],
				supportedLocales: [
					const Locale('en'), // English
					const Locale('fr'), // Hebrew
					const Locale.fromSubtags(languageCode: 'fr',countryCode: "CD"), 
					
				],
				title: 'Flutter',
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
											child: Image.asset("assets/roberto.jpg"),
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