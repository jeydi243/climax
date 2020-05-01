import 'dart:core';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieSer2 with ChangeNotifier{
	TMDB _service;
	ApiKeys _keys;

	MovieSer2() {
		_keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec', "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo");
		_service = TMDB(_keys);
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
	Future < Map > getMovieDetails(int id) async {
		return await _service.v3.movies.getDetails(id);
	}
	Future < Map > getMovieCredits(String creditId) async {
		return await _service.v3.credit.getDetails(creditId);
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
	Future < Map > getMovieVideos(int movieId, {String lang = "en-US"}) async {
		return await _service.v3.movies.getVideos(movieId);
	}
	Future < List < Map >> getMovieSimilar(int movieId, {int page = 1}) async {
		Map resulta = await _service.v3.movies.getSimilar(movieId, page: page);
		List < Map > list = [];
		for (var movie in resulta["results"]) {
			list.add(movie);
		}
		return list;

	}
	Future < Map > getTopRated({int page = 1}) async {
		return await _service.v3.movies.getTopRated(page: page);
	}
	Stream < Map > getLatestMovie({String lang = "en-US"}) async *{
		while (1 == 1) {
			yield await _service.v3.movies.getLatest(language: lang);
		}
	}
	Future < List < Map >> getPopular({
		int page = 1,
		String lang = "en-US"
	}) async {
		List list = [];
		var popular;
		try {
			popular = await _service.v3.movies.getPouplar(language: lang, page: page);
			for (var movie in popular["results"]) {
				list.add(movie);
			}
		} catch (e) {
			print(e);
		}
		return popular.results;

	}
	String getImageUrl(String path) {
		return _service.images.getUrl(path, size: ImageSizes.BACKDROP_SIZE_LOWEST);
	}
	Future < List < Map<String,dynamic> >> getTrend() async {

		List<Map<String,dynamic>> list = [];
		Map res ;
		try {
			res = await _service.v3.trending.getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);

			for (var result in res["results"]) {
				list.add(result);
			}
			// print("La longueur de la liste: ${list.length}");
			return list;
		} catch (e) {
			print("erreur: $e");
			return list;
		}
	
	}
}