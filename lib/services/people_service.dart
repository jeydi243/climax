import 'dart:core';
import 'package:climax/services/TMBDService.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PeopleService {
	TMDB _service;
  String _lang;
  
	PeopleService(String language) {
		_service = TMBDService().service;
    _lang = language;
	}

	Future < Map < String, dynamic >> getDetails(int personId) async {
		return await _service.v3.people.getDetails(personId,language: _lang);
	}

	Future < Map < String, dynamic >> getMovieCredits(int personId) async {
		return await _service.v3.people.getMovieCredits(personId);
	}
	Future < Map < String, dynamic >> getTVCredits(int personId) async {
		return await _service.v3.people.getTvCredits(personId);
	}
	Future < Map < String, dynamic >> getCombinedCredits(int personId) async {
		return await _service.v3.people.getCombinedCredits(personId);
	}
	Future < Map < String, dynamic >> getImagesOfPeople(int personId) async {
		return await _service.v3.people.getImages(personId);
	}
	Future < Map < String, dynamic >> getTaggedImagesOfPeople(int personId) async {
		return await _service.v3.people.getTaggedImages(personId);
	}
	// Future < Map < String, dynamic >> getNewlyPeople(String id) async {
	// 	return await _service.v3.people.get(id);
	// }
	Future < Map < String, dynamic >> getPopularPeople() async {
		return await _service.v3.people.getPopular();
	}


}