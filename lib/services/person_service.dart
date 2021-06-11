import 'dart:core';
import 'package:climax/models/person.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PersonService {
  TMDB _service;
  String _lang;

  PersonService(String language) {
    _service = TMBDService().service;
    _lang = language;
  }

  Future<Person> getDetails(int personId) async {
    GetStorage store = GetStorage();
    return Future.wait([
	  _service.v3.people.getDetails(personId,language: _lang),
      _service.v3.people.getCombinedCredits(personId, language: _lang),
	  _service.v3.people.getImages(personId)
    ]).then((List<Map> responses){
		String genre = store.read("tv-${responses[0]['gender']}") ?? store.read("movie-${responses[0]['gender']}");
		Person person = Person.personed(responses[0], genre);
		person.setCombinedCredits = responses[1];
		person.setImages = responses[2];
		return person;
	}).catchError((error,stack) =>print('$error au niveau de : $stack'));
    // return await _service.v3.people.getDetails(personId,language: _lang)
    // 	.then((mymap){
    // 		String name = store.read("tv-${mymap['gender']}") ?? store.read("movie-${mymap['gender']}");
    // 		print("le store vaut: $name");
    // 		return Person.personed(mymap, name);
    // 	}).then((person) {
    // 		person.setMovieCredit =
    // 	} )
    // 	.catchError((onError,stack)=>print("Erreur-- :$onError au niveau de: $stack"));
  }


  Future<Map<String, dynamic>> getImagesOfPeople(int personId) async {
    return await _service.v3.people.getImages(personId);
  }

  Future<Map<String, dynamic>> getTaggedImagesOfPeople(int personId) async {
    return await _service.v3.people.getTaggedImages(personId);
  }

  // Future < Map < String, dynamic >> getNewlyPeople(String id) async {
  // 	return await _service.v3.people.get(id);
  // }
  Future<Map<String, dynamic>> getPopularPeople() async {
    return await _service.v3.people.getPopular();
  }
}
