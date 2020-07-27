import 'dart:core';
import 'package:climax/Models/movie.dart';
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
    Future < Movie > getMovieDetails(int id) async {
		return Future.wait([
			_service.v3.movies.getDetails(id, language: _lang),
            _service.v3.movies.getImages(id),
			_service.v3.movies.getVideos(id)

		]).then((List responses){
			Movie m = Movie.fromMap(responses[0]);
			m.setImages = responses[1];
			m.setVideos = responses[2];
			return m;
		}).catchError((error,stack){
            print("$error au niveau de $stack");
		});
	}
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
	Future < List < Movie >> getUpcomming({int numeroPage = 1}) async {
		List < Movie > movies = [];
		Map res = {};
		try {
			res = await _service.v3.movies.getUpcoming(language: _lang,page: numeroPage);
			for (Map < String, dynamic > result in res["results"]) {
				Movie e = Movie.fromMap(result);
				movies.add(e);
			}
			return movies;
		} catch (e,s) {
			print("Erreur: $e au niveau de $s");
			return movies;
		}
	}
	Future < List < Map < String, dynamic >>> getMovieCredits(int movieId, String typeOfcast) async {
		List < Map < String, dynamic >> casting = [];
		return await _service.v3.movies.getCredits(movieId)
			.then((value) {
				for (Map < String, dynamic > item in value[typeOfcast]) {
					casting.add(item);
				}
				return casting;
			}).catchError((onError, stack) {
				print(stack);
			});

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
		List < Movie > movies = [];
		try {
			await _service.v3.movies.getPouplar(language: _lang, page: page)
				.then((populars) {
					for (Map < String, dynamic > movie in populars["results"]) {
						Movie e = Movie.fromMap(movie);
						movies.add(e);
					}
				}).catchError((onError, stac) {
					print(stac);
				});
			return movies;
		} catch (e) {
			print(e);
			return movies;
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
		} catch (e,s) {
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

}