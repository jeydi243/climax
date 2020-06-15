import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/services/person_service.dart';
import 'package:climax/Models/person.dart';
import 'package:climax/views/acteurDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Acteurs extends StatefulWidget {
    Acteurs({
        Key key,
        @required this.movieId
    }): super(key: key);
    final int movieId;

    @override
    _ActeursState createState() => _ActeursState();
}

class _ActeursState extends State < Acteurs > {
    @override
    Widget build(BuildContext context) {
        MovieService result = Provider.of < MovieService > (context);
        PersonService personservice = Provider.of < PersonService > (context);
        TMBDService tmm = Provider.of < TMBDService > (context);
        return Container(
            height: 100,
            child: FutureBuilder < List < Map < String, dynamic >>> (
                future: result.getMovieCredits(widget.movieId, "cast"),
                builder: (_, snap) {
                    if (snap.hasData) {
                        return ListView.builder(
                            itemCount: snap.data.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext ctxt, int index) {
                                return GestureDetector(
                                    onTap: () async {
                                        await personservice
                                            .getDetails(snap.data[index]['id'])
                                            .then((map) {
                                                return Person.Personed(map);
                                            }).then((person) {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) =>
                                                    ActeurDetails(person: person)));
                                            }).catchError((onError, stack) {
                                                print(stack);
                                            });
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                                height: 100,
                                                width: 90,
                                                child: ClipRRect(
                                                    child: FadeInImage.memoryNetwork(
                                                        fadeInCurve: Curves.bounceInOut,
                                                        fit: BoxFit.cover,
                                                        placeholder: kTransparentImage,
                                                        image: snap.data[index]["profile_path"] !=
                                                        null ?
                                                        tmm.getImageUrl(
                                                            snap.data[index]["profile_path"]) :
                                                        "https://via.placeholder.com/150.gif"),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                ),
                                            ),
                                    ));
                            });
                    }
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                            return Image.network("https://via.placeholder.com/150");
                        },
                    );
                },
            ));
    }
}