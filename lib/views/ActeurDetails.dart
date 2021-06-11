import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:climax/services/person_service.dart';
import 'package:climax/Models/person.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
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
    String selectedtypeContent = "movie";
    List<String> typeContents = <String>['movie', 'tv'];
    PersonService personservice = Provider.of<PersonService>(context);
    TMBDService service = Provider.of<TMBDService>(context);
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<Person>(
        future: personservice.getDetails(widget.personId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            widget.person = snapshot.data;
            Person person = snapshot.data;
            return Stack(
              children: <Widget>[
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) - 20,
                  width: MediaQuery.of(context).size.width,
                  child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: service.getImageUrl(person.profilePath) ??
                          "assets/heroes.gif"),
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
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "${snapshot.data.name}",
                                  style: GoogleFonts.gafata(
                                    color: Colors.amber,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Aka ",
                                          style: GoogleFonts.gafata(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        FadeAnimatedTextKit(
                                            isRepeatingAnimation: true,
                                            text: person.alsoKnownAs,
                                            textStyle: GoogleFonts.notoSerif(
                                              color: Colors.amber,
                                            ),
                                            textAlign: TextAlign.start,
                                            alignment: AlignmentDirectional
                                                .topStart // or Alignment.topLeft
                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      "${person.biography}",
                                      style:
                                          GoogleFonts.itim(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Connue pour son role dans',
                                      style: GoogleFonts.gafata(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    
                                  ],
                                ),
                                SizedBox(
                                    height: 100,
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.person.combinedCredits.length,
                                      itemBuilder: (context, index) {
                                       
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                color: Colors.white,
                                                child: Image.network(
                                                  service.getImageUrl(widget
                                                                  .person
                                                                  .combinedCredits[
                                                              'cast'][index]
                                                          ['poster_path'] ??
                                                      "https://via.placeholder.com/150"),
                                                ),
                                              ),
                                            ),
                                          );
                                        
                                      },
                                    ))
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
