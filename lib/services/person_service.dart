import 'dart:core';
import 'package:climax/Models/person.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PersonService {
	TMDB _service;
  String _lang;
  
	PersonService(String language) {
		_service = TMBDService().service;
    _lang = language;
	}

	Future < Person> getDetails(int personId) async {
		GetStorage store = GetStorage();
		return await _service.v3.people.getDetails(personId,language: _lang)
			.then((mymap){
				String name = store.read("tv-${mymap['gender']}") ?? store.read("movie-${mymap['gender']}");
				print("le store vaut: $name");
				return Person.personed(mymap, name);
			})
			.catchError((onError,stack)=>print("Erreur-- :$onError au niveau de: $stack"));
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