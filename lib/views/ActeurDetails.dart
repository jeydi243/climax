import 'package:climax/services/TMBDService.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:climax/services/person_service.dart';
import 'package:climax/Models/person.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:transparent_image/transparent_image.dart';

class ActeurDetails extends StatefulWidget {
  ActeurDetails({Key key, this.personId}) : super(key: key);
  Person person;
  int personId;
  @override
  _ActeurDetailsState createState() => _ActeurDetailsState();
}

class _ActeurDetailsState extends State<ActeurDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersonService personservice = Provider.of<PersonService>(context);
    TMBDService service = Provider.of<TMBDService>(context);
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<Person>(
        future: personservice.getDetails(widget.personId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) - 20,
                  width: MediaQuery.of(context).size.width,
                  child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: service.getImageUrl(snapshot.data.profilePath) ??
                          "https://via.placeholder.com/150"),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2 + 40,
                      width: MediaQuery.of(context).size.width,
                      color: Pigment.fromString("#141E51"),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "${snapshot.data.name}",
                                  style: GoogleFonts.googleSans(
                                    color: Colors.amber,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                Center(
                                  child: Row(
									  mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Aka "),
                                      FadeAnimatedTextKit(
                                          text: snapshot.data.alsoKnownAs,
                                          textStyle: GoogleFonts.googleSans(
                                            color: Colors.amber,
                                          ),
                                          textAlign: TextAlign.start,
                                          alignment: AlignmentDirectional
                                              .topStart // or Alignment.topLeft
                                          ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Container(
              child: Text("${snapshot.error}"),
            );
          } else {
            return Container();
          }
        },
      ),
    ));
  }
}
