import 'package:climax/Models/movie.dart';
import 'package:climax/services/tmdb.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieServices {
	Movie movie;
	String lang = "en-US";
	TMDB tmdb = new TMDBclass().gettmdb;


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
	Future<Map> getLatestMovies(int movieId)async {
		return await this.tmdb.v3.movies.getLatest(language: lang);
	}
	Future<Map> searchMulti(String lang, String query, int page, bool adult, String region)async {
		return await tmdb.v3.search.queryMulti(query);
	}
}