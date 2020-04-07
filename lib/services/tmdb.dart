import 'package:tmdb_api/tmdb_api.dart';

class TMDBclass {
	static ApiKeys _keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo');
	TMDB _tmdb = TMDB(_keys);

	TMDB get gettmdb{
		return _tmdb;
	}
	Future < Map < dynamic, dynamic >> getTrending() async {
		return await _tmdb.v3.trending.getTrending(timeWindow: TimeWindow.week);
	}
	void tester() async {

	}

}