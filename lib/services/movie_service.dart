import 'dart:core';
import 'package:climax/Models/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieService {
	TMDB _service;
	ApiKeys _keys;
	String _lang;

	MovieService() {
		_keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec', "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo");
		_service = TMDB(_keys);
		_lang = "fr-FR";
	}
	TMDB get service => _service;
	String get language => _lang;

	Future < List < Map >> searchMulti(String query) async { //Search Movies,Tv and People in one request
		List < Map > mylist = [];
		try {
			Map pagedResult = await this._service.v3.search.queryMulti(query);

			for (var movie in pagedResult["results"]) {
				mylist.add(movie);
			}
		} catch (e) {}

		return mylist;
	}
	Future < List < Map >> getUpcomming() async {
		List < Map > list = [];
		var result;
		try {
			result = await _service.v3.movies.getUpcoming();

			for (var movie in result["results"]) {
				list.add(movie);
			}

		} catch (e) {
			print(e);
		}
		return list;
	}
	Future < Movie > getMovieDetails(int id) async {
		Movie m = Movie.fromMap(await _service.v3.movies.getDetails(id, language: _lang));
		return m;
	}
	Future < Map < String, dynamic > > getMovieCredits(int movieId) async {
		return await _service.v3.movies.getCredits(movieId);
	}
	Future < List < String >> getMovieImages(int movieId, String type) async { //just retrieve backdrops or posters Images file path ex: /ksecdigo2f.jpg
		List < String > mylist = [];
		try {
			Map collect = await _service.v3.movies.getImages(movieId);
			List < Map > backdrops = collect["backdrops"];
			List < Map > posters = collect["posters"];

			if (type == "backdrop") {
				for (var path in backdrops) {
					mylist.add(path['file_path']);
				}
			} else if (type == "posters") {
				for (var path in posters) {
					mylist.add(path['file_path']);
				}
			}
		} catch (e) {
			
		}

		return mylist;
	}
	Future < Map > getMovieVideos(int movieId) async {
		return await _service.v3.movies.getVideos(movieId);
	}
	Future < List < Map >> getMovieSimilar(int movieId, {
		int page = 1
	}) async {
		Map resulta = await _service.v3.movies.getSimilar(movieId, page: page, language: _lang);
		List < Map > list = [];
		for (var movie in resulta["results"]) {
			list.add(movie);
		}
		return list;

	}
	Future < Map > getTopRated({
		int page = 1
	}) async {
		return await _service.v3.movies.getTopRated(page: page, language: _lang);
	}
	Stream < Map > getLatestMovie() async *{
		while (1 == 1) {
			yield await _service.v3.movies.getLatest(language: _lang);
		}
	}
	Future < List < Movie >> getPopular({
		int page = 1
	}) async {
		List<Movie> movies = [];
		try {
			await _service.v3.movies.getPouplar(language: _lang, page: page)
				.then((populars) {
					for (Map< String, dynamic > movie in populars["results"]) {
						Movie e = Movie.fromMap(movie);
						movies.add(e);
					}
				}).catchError((onError,stac){
					print(stac);
				});
			return movies;
		} catch (e) {
			print(e);
			return movies;
		}
	}
	String getImageUrl(String path) {
		return _service.images.getUrl(path, size: ImageSizes.POSTER_SIZE_HIGHEST);
	}
	Future < List < Map < String, dynamic > >> getTrend2() async {
		List < Map < String, dynamic >> listtrend = [];
		try {
			await _service.v3.trending.getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week).then((res) {
				for (var result in res["results"]) {
					listtrend.add(result);
				}
			}).catchError((onError) {
				print(onError);
			});
			return listtrend;
		} catch (e) {
			return listtrend;
		}

	}
	Future < List < Movie >> getTrend() async {
		List < Movie > movies = [];
		Map res = {};
		try {
			res = await _service.v3.trending.getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);

			for (Map < String, dynamic > result in res["results"]) {
				Movie e = Movie.fromMap(result);
				movies.add(e);
			}
			return movies;
		} catch (e) {
			print("Erreur: $e");
			return movies;
		}

	}
	Future < List < String > > getGenreById(List < int > genre_id) async {
		List < String > list_name = new List();
		Map < String, dynamic > res;
		try {
			res = await _service.v3.geners.getMovieList();
			for (int item in genre_id) {
				for (Map < String, dynamic > genre in res["genres"]) {
					if (item == genre['id']) {
						list_name.add(genre['name']);
					}
				}
			}
			return list_name;
		} catch (e) {
			print(e);
		}
	}
	Future < List < Map < String, dynamic >>> getVideos(int movieId) async {
		Map < String, dynamic > res = await _service.v3.movies.getVideos(movieId);
	}
}