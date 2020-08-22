import 'package:climax/Models/movie.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageDeux extends StatelessWidget {
  const PageDeux({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	TMBDService tmm = Provider.of<TMBDService>(context);
    MovieService movieservice = Provider.of<MovieService>(context);
    return Row(
      children: <Widget>[
        FutureBuilder<List<Movie>>(
          future: movieservice.getTrend(),
          builder: (_, snap) {
            if (snap.hasData) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snap.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Image.network(
                        tmm.getImageUrl(snap.data[index].backdropPath));
                  },
                ),
              );
            } else {
              return Container(
                child: Text(
                  'Le Future ne remet rien! ',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}