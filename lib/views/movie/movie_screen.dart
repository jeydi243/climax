import 'package:climax/Models/movie.dart';
import 'package:climax/components/CustomshortMovieList.dart';
import 'package:climax/components/acteurs.dart';
import 'package:climax/components/genre.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({Key key, @required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieService result = Provider.of<MovieService>(context);
    TMBDService tmm = Provider.of<TMBDService>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
					
          SliverAppBar(
            backgroundColor: Pigment.fromString("#141E51"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () {})
            ],
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: GestureDetector(
                // onVerticalDragEnd: (gf) {
                // 	Navigator.pop(context);
                // },
                child: Stack(children: [
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        tmm.getImageUrl(widget.movie.posterPath),
                        fit: BoxFit.cover,
                      )),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0, 1),
                              end: Alignment(0, -1),
                              colors: [
                            Pigment.fromString("#141E51"),
                            Pigment.fromString("#141E51").withOpacity(0.2),
                            Colors.transparent
                          ])),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 800,
                padding: EdgeInsets.all(10.0),
                color: Pigment.fromString("#141E51"),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Text(
                              "${widget.movie.title}",
                              style: GoogleFonts.courgette(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber[100]),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent.withOpacity(0.3),
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.amber,
                                        style: BorderStyle.solid,
                                        width: 2.0))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 2.0,
                                  bottom: 2.0),
                              child: Text(
                                "${widget.movie.voteAverage}",
                                style: GoogleFonts.courgette(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amberAccent.withOpacity(0.3),
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.amber,
                                      style: BorderStyle.solid,
                                      width: 2.0))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                            child: Text(
                              "${widget.movie.voteCount}",
                              style: GoogleFonts.courgette(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amberAccent.withOpacity(0.3),
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.amber,
                                      style: BorderStyle.solid,
                                      width: 2.0))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                            child: Text(
                              "${widget.movie.runtime}",
                              style: GoogleFonts.courgette(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: 35, child: Genre(genres: widget.movie.genres)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Description',
                                style: GoogleFonts.courgette(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "${widget.movie.overview}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Acteurs',
                              style: GoogleFonts.courgette(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            Spacer(),
                            FlatButton(
                              splashColor: Colors.amber.withOpacity(.2),
                              onPressed: () {},
                              child: Text(
                                'Plus',
                                style: TextStyle(color: Colors.amber),
                              ),
                            )
                          ],
                        ),
                        Acteurs(movieId: widget.movie.id)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Similaires',
                              style: GoogleFonts.courgette(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: FutureBuilder<List<Movie>>(
                            future: result.getTrend(),
                            builder: (_, snap) {
                              if (snap.hasData) {
                                return CustomshoMovieList(
                                    moviesList: snap.data);
                              } else if (snap.hasError) {
                                return Container();
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
