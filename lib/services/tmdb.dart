import 'package:flutter/foundation.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

class TMDBclass with ChangeNotifier{
	TmdbService service;
	static const String ApiKey = "f69d3de4926e09f3e28b56b471471aec";

	TMDBclass() {
		try {
			TmdbService service = TmdbService(ApiKey);
			var epa = service.initConfiguration();
		} catch (e) {
			print(e);
		}
	}


	TmdbService get tmdb => this.service;

}