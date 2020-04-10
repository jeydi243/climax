import 'dart:core';

import 'package:climax/services/tmdb.dart';
import 'package:flutter/foundation.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

class MovieSer with ChangeNotifier {
	TmdbService _service;
	MovieSer() {
		_service = TMDBclass().tmdb;
	}

	Future < List < MovieBase >> movieSearch(String query) async {
		List < MovieBase > mylist = [];
		try {
			var pagedResult = await _service.movie.search(query);

			for (var movie in pagedResult.results) {
				print("${movie.title} - ${movie.voteAverage}");
				mylist.add(movie);
			}
		} catch (e) {}

		return mylist;
	}
	Future < List < MovieBase >> getAiringToday() async {
		var pagedTvResult = await _service.tv.getAiringToday();
		List < MovieBase > mylist = [];
		for (var tv in pagedTvResult.results) {
			print("${tv.name} - ${tv.voteAverage}");
		}
		return mylist;
	}
	Future resilienceExample(TmdbService service) async {
		// generate many requests
		// number of requests is over the allowed threshold
		// but thanks to integrated resilience, all the requests are completed successfully
		var futures = Iterable.generate(100)
			.map((x) => service.movie.search(x.toString()))
			.toList();
		await Future.wait(futures);
	}
	Future < Movie > getMovieDetails(int id) async {
		return await _service.movie.getDetails(id);
	}
	Future < Movie > getMovieCredits(int movieId) async {
		return await _service.movie.getDetails(movieId);
	}
	Future < List < ImageInfo >> getMovieImagesPosters(int movieId, {
		String qualite
	}) async {
		var collect = await _service.movie.getImages(movieId);
		List list = [];
		for (var images in collect.posters) {
			list.add(images);
		}
		return list;
	}
	Future < List < ImageInfo >> getMovieImagesBackdrops(int movieId, {
		String qualite
	}) async {
		var collect = await _service.movie.getImages(movieId);
		List list = [];
		for (var images in collect.backdrops) {
			list.add(images);
		}
		return list;
	}
	Future < List < Video >> getMovieVideos(int movieId, String lang) async {
		return await _service.movie.getVideos(movieId, language: lang);
	}
	Future < List < MovieBase >> getMovieSimilar(int movieId, {
		MovieDiscoverSettings opt
	}) async {
		var movie = await _service.movie.getDetails(movieId,
			appendSettings: AppendSettings(
				// includeRecommendations: true,
				includeSimilarContent: true,
			));

		// print("${movie.recommendations[0].title}");
		return movie.similar;
	}
	Future < PagedResult < MovieBase >> getTopRated(int movieId, int page, MovieSearchSettings opt) async {
		return await _service.movie.getTopRated(page: page, settings: opt);
	}
	Future < Movie > getLatestMovie(QualitySettings opt, {
		String lang = "en-US"
	}) async {
		return await _service.movie.getLatest(language: lang, qualitySettings: opt);
	}
	Future < List < MovieBase >> getPopular() async {
		List fd = [];
		var popular;
		try {
			popular = await _service.movie.getPopular();
			for (var movie in popular.results) {
				print("${movie.title} - ${movie.voteAverage}");
				fd.add(movie);
			}
		} catch (e) {
			print(e);
		}
		return popular.results;
		// var discover = await _service.movie.discover(
		// 	settings: MovieDiscoverSettings(
		// 		primaryReleaseDateGTE: Date(day: 15, month: 9, year: 2010),
		// 		primaryReleaseDateLTE: Date(day: 22, month: 10, year: 2015),
		// 		voteAverageGTE: 5.5,
		// 		withPeople: [108916, 7467],
		// 		sortBy: SortBy.popularity.desc,
		// 		quality: QualitySettings(
		// 			backdropQuality: AssetQuality.High,
		// 			logoQuality: AssetQuality.High,
		// 			posterQuality: AssetQuality.High,
		// 			profileQuality: AssetQuality.High,
		// 			stillQuality: AssetQuality.High,
		// 		),
		// 	),
		// );

		// for (var movie in discover.results) {
		// 	print("${movie.title} - ${movie.voteAverage} - ${movie.releaseDate}");
		// }



		// var tv = await _service.tv.getDetails(1399,
		// 	appendSettings: AppendSettings(
		// 		includeRecommendations: true,
		// 		includeSimilarContent: true,
		// 	));
		// print("${tv.originalName} - ${tv.seasons.length}");
		// print("${tv.similar[0].originalName} - ${tv.similar[0].firstAirDate}");

		// print("Countries: ${(await _service.getAllCountries()).length}");
		// print("MovieGenres: ${(await _service.getAllTvGenres()).length}");
	}
}