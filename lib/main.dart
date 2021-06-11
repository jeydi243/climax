// import 'package:bot_toast/bot_toast.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:climax/services/auth_service.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/services/person_service.dart';
import 'package:climax/services/ticket_service.dart';
import 'package:climax/views/home.dart';
import 'package:climax/views/user/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(); //initialize firebase app
    await GetStorage.init(); //initialise GetStorage
    await TMBDService().getAllGenres();
  } catch (e) {
    print(e);
  }
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
        ChangeNotifierProvider<Auth>(
          create: (_) => new Auth(),
          lazy: false,
        ),
        Provider<PersonService>(
          create: (_) => new PersonService("fr-FR"),
          lazy: false,
        ),
        Provider<TicketService>(
          create: (_) => new TicketService(),
          lazy: false,
        )
      ],
      child: GetMaterialApp(
          onInit: () async {
            await TMBDService().getAllGenres();
          },
          title: 'Climax',
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) {
              Auth auth = Provider.of<Auth>(context);
              return StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.data == User) {
                      return Home();
                    } else {
                      return LoginPage();
                    }
                  });
            },
          )),
    );
  }
}
