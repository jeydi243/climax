import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/auth.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/services/person_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

import 'views/login.dart';

main() async {
  await GetStorage.init();
  await TMBDService().getAllGenres();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TMBDService>(
          create: (_) => new TMBDService(),
          lazy: false,
        ),
        Provider<MovieService>(
          create: (_) => new MovieService(),
          lazy: false,
        ),
        Provider<Auth>(
          create: (_) => new Auth(),
          lazy: false,
        ),
        Provider<PersonService>(
          create: (_) => new PersonService("fr-FR"),
          lazy: false,
        )
      ],
      child: GetMaterialApp(
        onInit: () async {
          await TMBDService().getAllGenres();
        },
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
			backgroundColor: Pigment.fromString("#141E51"),
          body: SafeArea(
            child: Container(
              height: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.loose,
                children: <Widget>[
                //   SizedBox.expand(
                //     child: FittedBox(
                //       fit: BoxFit.cover,
                //       child: Image.asset("assets/roberto.jpg"),
                //     ),
                //   ),
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
