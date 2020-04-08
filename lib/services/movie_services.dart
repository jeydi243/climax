import 'package:climax/Models/movie.dart';
import 'package:climax/services/tmdb.dart';
import 'package:flutter/foundation.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieServices with ChangeNotifier{
	Movie movie;
	String lang = "en-US";
	TMDB tmdb = new TMDBclass().gettmdb;
  String base_url = "";
  String file_size = "";
  String file_path = "";


	Future<Map> getMovieDetails(int id)async {
		return await this.tmdb.v3.movies.getDetails(id);
	}
	Future<Map> getMovieAccountStates(int movieId)async {
		return await this.tmdb.v3.movies.getAccountStatus(movieId);
	}
	Future<Map> getMovieCredits(int movieId)async {
		return await this.tmdb.v3.movies.getCredits(movieId);
	}
	Future<Map> getMovieImages(int movieId)async {
		return await this.tmdb.v3.movies.getImages(movieId);
	}
	Future<Map> getMovieVideos(int movieId)async {
		return await this.tmdb.v3.movies.getVideos(movieId);
	}
	Future<Map> getMovieSimilar(int movieId)async {
		return await this.tmdb.v3.movies.getSimilar(movieId);
	}
	Future<Map> getMovieReviews(int movieId,int page)async {
		return await this.tmdb.v3.movies.getReviews(movieId,page: page);
	}
	Future<Map> getLatestMovie()async {
		return await this.tmdb.v3.movies.getLatest(language: lang);
	}

}