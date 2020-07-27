import 'dart:math';
import 'package:climax/components/tickettree.dart';
import 'package:climax/services/auth.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/login.dart';
import 'package:climax/views/home/page_deux.dart';
import 'package:climax/views/home/page_un.dart';
import 'package:climax/views/home/page_trois.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  FocusNode fsn;
  @override
  void initState() {
    super.initState();
    fsn = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    MovieService movieservice = Provider.of<MovieService>(context);

    return Scaffold(
      backgroundColor: Pigment.fromString("#141E51"),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor:Colors.transparent, //Background color of selected
        buttonBackgroundColor: Pigment.fromString("#FFBA02"),
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 500),
        color: Pigment.fromString("#FFBA02"),
        height: 55,
        index: 0,
        items: <Widget>[
          Icon(Icons.add, size: 30, color: Pigment.fromString("200540")),
          Icon(Icons.local_movies,
              size: 30, color: Pigment.fromString("200540")),
          Icon(FontAwesomeIcons.calendar,
              size: 30, color: Pigment.fromString("200540")),
          Icon(Icons.accessibility_new,
              size: 30, color: Pigment.fromString("200540")),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.bars,
                        ),
                        color: Colors.amber),
                    Text(
                      "Climax",
                      style: GoogleFonts.lobster(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await auth.signOut().then((value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        backgroundImage:
                            NetworkImage("https://via.placeholder.com/150"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            color: Colors.white.withOpacity(0.2),
                            child: TextFormField(
                              cursorColor: Colors.amber,
                              style: TextStyle(
                                color: Colors.amber[300],
                              ),
                              decoration: InputDecoration(
                                border: null,
                                prefix: Icon(FontAwesomeIcons.search, size: 17),
                                hintText: ("Rechercher un film ou une serie"),
                                isDense: true,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(8),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                bybuilder(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget four(BuildContext context) {
    return Container(
        height: double.infinity, width: double.infinity, child: TicketTree());
  }

  Widget bybuilder(BuildContext context) {
    if (_page == 0) {
      return Expanded(
        child: PageUn(),
      );
    } else if (_page == 1) {
      return Expanded(
        child: PageDeux(),
      );
    } else if (_page == 2) {
      return Expanded(child: PageTrois());
    } else {
      return Expanded(child: four(context));
    }
  }
}

class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
