import 'package:climax/Models/movie.dart';
import 'package:climax/components/pageV.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../movie_screen.dart';

class PageUn extends StatelessWidget {
  const PageUn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	  MovieService movieservice = Provider.of<MovieService>(context);
	return ListView(physics: BouncingScrollPhysics(), children: [
      Row(
		  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Populaires",
            style: GoogleFonts.lobster(color: Colors.amber, fontSize: 20),
          ),
          Spacer(),
          SizedBox(
            height: 25,
            child: FlatButton(
                padding: EdgeInsets.only(left: 0.0),
                splashColor: Colors.amber.withOpacity(0.3),
                shape: Border(
                    left: BorderSide(
                  color: Colors.amber,
                )),
                onPressed: () {},
                child: Text(
                  "Voir plus",
                  style: GoogleFonts.lobster(color: Colors.amber, fontSize: 13),
                )),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: <Widget>[
            PageV(),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Tendance",
            style: GoogleFonts.lobster(color: Colors.amber, fontSize: 20),
          ),
          SizedBox(
            height: 25,
            child: FlatButton(
                padding: EdgeInsets.only(left: 0.0),
                splashColor: Colors.amber.withOpacity(0.3),
                shape: Border(
                    left: BorderSide(
                  color: Colors.amber,
                )),
                onPressed: () {},
                child: Text(
                  "Voir plus",
                  style: GoogleFonts.lobster(color: Colors.amber, fontSize: 13),
                )),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            FutureBuilder<List<Movie>>(
              future: movieservice.getTrend(),
              builder: (_, snap) {
                TMBDService tmm = Provider.of<TMBDService>(context);
                if (snap.hasData) {
                  return Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: snap.data.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (fd) => MovieScreen(
                                        movie: snap.data[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      fit: BoxFit.cover,
                                      image: tmm.getImageUrl(
                                          snap.data[index].posterPath),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else if (snap.hasError) {
                  return Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        // color: UniqueColorGenerator.getColor(),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),
                            fit: BoxFit.fill)),
                  );
                }
                return Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Bientôt",
            style: GoogleFonts.lobster(color: Colors.amber, fontSize: 20),
          ),
		  
          SizedBox(
            height: 25,
            child: FlatButton(
                padding: EdgeInsets.only(left: 0.0),
                splashColor: Colors.amber.withOpacity(0.3),
                shape: Border(
                    left: BorderSide(
                  color: Colors.amber,
                )),
                onPressed: () {},
                child: Text(
                  "Voir plus",
                  style: GoogleFonts.lobster(color: Colors.amber, fontSize: 13),
                )),
          )
        ],
      ),
	  Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            FutureBuilder<List<Movie>>(
              future: movieservice.getUpcomming(),
              builder: (_, snap) {
                TMBDService tmm = Provider.of<TMBDService>(context);
                if (snap.hasData) {
                  return Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: snap.data.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              onTap: () {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (fd) => MovieScreen(
                              //           movie: snap.data[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      fit: BoxFit.cover,
                                      image: tmm.getImageUrl(
                                          snap.data[index].posterPath),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else if (snap.hasError) {
                  return Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        // color: UniqueColorGenerator.getColor(),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),
                            fit: BoxFit.fill)),
                  );
                }
                return Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
	  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Les Mieux notés",
            style: GoogleFonts.lobster(color: Colors.amber, fontSize: 20),
          ),
		  
          SizedBox(
            height: 25,
            child: FlatButton(
                padding: EdgeInsets.only(left: 0.0),
                splashColor: Colors.amber.withOpacity(0.3),
                shape: Border(
                    left: BorderSide(
                  color: Colors.amber,
                )),
                onPressed: () {},
                child: Text(
                  "Voir plus",
                  style: GoogleFonts.lobster(color: Colors.amber, fontSize: 13),
                )),
          )
        ],
      ),
	  Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            FutureBuilder<List<Movie>>(
              future: movieservice.getTopRated(),
              builder: (_, snap) {
                TMBDService tmm = Provider.of<TMBDService>(context);
                if (snap.hasData) {
                  return Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: snap.data.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              onTap: () {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (fd) => MovieScreen(
                              //           movie: snap.data[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      fit: BoxFit.cover,
                                      image: tmm.getImageUrl(
                                          snap.data[index].posterPath),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else if (snap.hasError) {
                  return Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        // color: UniqueColorGenerator.getColor(),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"),
                            fit: BoxFit.fill)),
                  );
                }
                return Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
	]);
  }
}