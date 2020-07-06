import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_api/tmdb_api.dart';

enum Isize {
  PSM,
}

class TMBDService {
  TMDB _service;
  ApiKeys _keys;

  TMBDService() {
    _keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec',
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo");
    _service = TMDB(_keys);
  }

  TMDB get service => _service;
  Future<String> getGenreNameOfMovie(int genre_id) async {
    List<String> list_name = [];

    return await _service.v3.geners.getMovieList().then((res) {
      for (Map<String, dynamic> genre in res["genres"]) {
        if (genre_id == genre['id']) {
          return genre['name'];
        }
      }
      return "genre movie introuvable";
    }).catchError((onError, stack) {
      print(stack);
      return list_name;
    });
  }

  Future<List<String>> getGenreNameOfTv(int genre_id) async {
    List<String> list_name = [];

    return await _service.v3.geners.getTvlist().then((res) {
      for (Map<String, dynamic> genre in res["genres"]) {
        if (genre_id == genre['id']) {
          return genre['name'];
        }
      }
      return "genre TV introuvable";
    }).catchError((onError, stack) {
      print(stack);
      return list_name;
    });
  }

  String getImageUrl(String path, {String size}) {
    switch (size) {
      case "PSM":
        return _service.images
            .getUrl(path, size: ImageSizes.POSTER_SIZE_MEDIUM);
        break;
      case "PSH":
        return _service.images.getUrl(path, size: ImageSizes.POSTER_SIZE_HIGH);
        break;
      case "PSHH":
        return _service.images
            .getUrl(path, size: ImageSizes.POSTER_SIZE_HIGHEST);
        break;
      case "PSL":
        return _service.images.getUrl(path, size: ImageSizes.POSTER_SIZE_LOW);
        break;
      case "PSLL":
        return _service.images
            .getUrl(path, size: ImageSizes.POSTER_SIZE_LOWEST);
        break;
      case "PSM+":
        return _service.images
            .getUrl(path, size: ImageSizes.POSTER_SIZE_MEDIUMPLUS);
        break;
      case "BSH":
        return _service.images
            .getUrl(path, size: ImageSizes.BACKDROP_SIZE_HIGHEST);
        break;
      case "BSM":
        return _service.images
            .getUrl(path, size: ImageSizes.BACKDROP_SIZE_MEDIUM);
        break;
      case "BSL":
        return _service.images
            .getUrl(path, size: ImageSizes.BACKDROP_SIZE_LOWEST);
        break;
      case "PrSH":
        return _service.images
            .getUrl(path, size: ImageSizes.PROFILE_SIZE_HIGHEST);
        break;
      case "PrSL":
        return _service.images
            .getUrl(path, size: ImageSizes.PROFILE_SIZE_LOWEST);
        break;
      case "PrSM":
        return _service.images
            .getUrl(path, size: ImageSizes.PROFILE_SIZE_LOWEST);
        break;
      case "Or":
        return _service.images.getUrl(path, size: ImageSizes.ORIGINAL);
        break;
      default:
        return _service.images
            .getUrl(path, size: ImageSizes.STILL_SIZE_HIGHEST);
    }
  }

  Future<void> getAllGenres() async {
    Map<dynamic, dynamic> all = await _service.v3.geners.getMovieList();
    Map<dynamic, dynamic> all2 = await _service.v3.geners.getMovieList();
    try {
      for (Map<String, dynamic> map in all['genres']) {
        GetStorage().write('movie-${map['id']}', map['name']);
      }
	  for (Map<String, dynamic> map in all2['genres']) {
        GetStorage().write('tv-${map['id']}', map['name']);
		
      }

    } catch (e, stack) {
      print(stack);
    }
  }
}
