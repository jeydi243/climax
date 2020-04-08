import 'package:climax/services/tmdb.dart';
import 'package:flutter/foundation.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

class MovieService with ChangeNotifier {
	TmdbService _service;

	MovieService() {
		_service = TMDBclass().tmdb;
	}

	Future < List < MovieBase >> MovieSearch(String query) async {
		var pagedResult = await _service.movie.search(query);
		List < MovieBase > mylist = [];

		for (var movie in pagedResult.results) {
			print("${movie.title} - ${movie.voteAverage}");
			mylist.add(movie);
		}
		return mylist;
	}
	Future < List < MovieBase >> getAiringToday() async {
		var pagedTvResult = await _service.tv.getAiringToday();
		List < MovieBase > mylist = [];
		for (var tv in pagedTvResult.results) {
			print("${tv.name} - ${tv.voteAverage}");
		}
	}
	Future List < MovieBase > Mo() async {
		var popular = await _service.movie.getPopular();

		for (var movie in popular.results) {
			print("${movie.title} - ${movie.voteAverage}");
		}

		var discover = await _service.movie.discover(
			settings: MovieDiscoverSettings(
				primaryReleaseDateGTE: Date(day: 15, month: 9, year: 2010),
				primaryReleaseDateLTE: Date(day: 22, month: 10, year: 2015),
				voteAverageGTE: 5.5,
				withPeople: [108916, 7467],
				sortBy: SortBy.popularity.desc,
				quality: QualitySettings(
					backdropQuality: AssetQuality.High,
					logoQuality: AssetQuality.High,
					posterQuality: AssetQuality.High,
					profileQuality: AssetQuality.High,
					stillQuality: AssetQuality.High,
				),
			),
		);

		for (var movie in discover.results) {
			print("${movie.title} - ${movie.voteAverage} - ${movie.releaseDate}");
		}



		var tv = await _service.tv.getDetails(1399,
			appendSettings: AppendSettings(
				includeRecommendations: true,
				includeSimilarContent: true,
			));
		print("${tv.originalName} - ${tv.seasons.length}");
		print("${tv.similar[0].originalName} - ${tv.similar[0].firstAirDate}");

		print("Countries: ${(await _service.getAllCountries()).length}");
		print("MovieGenres: ${(await _service.getAllTvGenres()).length}");
	}

	// generate many requests
	// number of requests is over the allowed threshold
	// but thanks to integrated resilience, all the requests are completed successfully
	Future resilienceExample(TmdbService service) async {
		var futures = Iterable.generate(100)
			.map((x) => service.movie.search(x.toString()))
			.toList();
		await Future.wait(futures);
	}

	Future < Movie > getMovieDetails(int id) async {
		return await _service.movie.getDetails(id);
	}

	Future < Map > getMovieCredits(int movieId) async {
		return await _service.movie.getDetails(id)
	}
	Future < ImageCollection > getMovieImages(int movieId, {
		String qualite
	}) async {
		return await _service.movie.getImages(movieId);
	}
	Future < List < Video >> getMovieVideos(int movieId, String lang) async {
		return await _service.movie.getVideos(movieId, language: lang);
	}
	Future < Map > getMovieSimilar(int movieId, MovieDiscoverSettings opt) async {
		var movie = await _service.movie.getDetails(671,
			appendSettings: AppendSettings(
				includeRecommendations: true,
				includeSimilarContent: true,
			));

		print("${movie.recommendations[0].title}");
		print("${movie.similar[0].title}");
	}
	Future < Map > getMovieReviews(int movieId, int page) async {
		return await _service.movie.getReviews(movieId, page: page);
	}
	Future < Map > getLatestMovie() async {
		return await _service.movie.getLatest(language: lang);
	}

}