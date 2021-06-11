import 'package:climax/models/movie.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:climax/services/movie_service.dart';
import 'package:climax/views/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class PageDeux extends StatefulWidget {
  PageDeux({Key key}) : super(key: key);

  @override
  _PageDeuxState createState() => _PageDeuxState();
}

class _PageDeuxState extends State<PageDeux> {
  final searchTextController = new TextEditingController();
  String query = "";
  String type = "movies";
	

  @override
  Widget build(BuildContext context) {
    TMBDService service = Provider.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                    child: TextField(
                      controller: searchTextController,
                      onChanged: (value) {
                        setState(() {
                          query = value;
                          print(value);
                        });
                      },
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
        Expanded(
          child: FutureBuilder<List<Movie>>(
            future: service.search(type, query),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.length >= 1) {
                print(snapshot.data);
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: ListTile(
                          onTap: () {
                            Get.to(MovieScreen(movie: snapshot.data[index]));
                          },
                          title: Text(
                            "${snapshot.data[index].title}",
                            style: GoogleFonts.gafata(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Sortie le ${snapshot.data[index].releaseDate}",
                            style: GoogleFonts.gafata(color: Colors.amber),
                          ),
                          //leading: Image.network(service.getImageUrl(snapshot.data["results"][index]['poster_path'] ?? snapshot.data["results"][index]['backdrop_path'])),
                          leading: FadeInImage.memoryNetwork(
                            fadeInCurve: Curves.easeInOutCirc,
                            fit: BoxFit.cover,
                            image: service.getImageUrl(
                                snapshot.data[index].posterPath ??
                                    snapshot.data[index].backdropPath ??
                                    '/kqjL17yufvn9OVLyXYpvtyrFfak.jpg'),
                            placeholder: kTransparentImage,
                          )),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("En attente ...");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading(
                  color: Colors.amber,
                  size: 60,
                );
              }
              return Text(
                "Rechercher...",
                style: GoogleFonts.gafata(color: Colors.amber),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    //Dispose the controller when the screen is disposed
    searchTextController.dispose();
    super.dispose();
  }
}
