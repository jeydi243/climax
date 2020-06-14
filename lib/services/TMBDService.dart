import 'package:tmdb_api/tmdb_api.dart';

class TMBDService {
	TMDB _service;
	ApiKeys _keys;

	TMBDService() {
		_keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec',
			"eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo");
		_service = TMDB(_keys);
	}

	TMDB get service => _service;
	Future < String > getGenreNameOfMovie(int genre_id) async {
		List < String > list_name = [];

		return await _service.v3.geners.getMovieList().then((res) {
			for (Map < String, dynamic > genre in res["genres"]) {
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

	Future < List < String >> getGenreNameOfTv(int genre_id) async {
		List < String > list_name = [];

		return await _service.v3.geners.getTvlist().then((res) {
			for (Map < String, dynamic > genre in res["genres"]) {
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
	String getImageUrl(String path) {
		return _service.images.getUrl(path, size: ImageSizes.POSTER_SIZE_MEDIUM);
	}
}