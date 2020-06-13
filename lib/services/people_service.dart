import 'dart:core';
import 'package:climax/services/TMBDService.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PeopleService {
	TMDB _service;
	PeopleService() {
		_service = TMBDService().service;
	}

}