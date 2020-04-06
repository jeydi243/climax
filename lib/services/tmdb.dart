import 'package:tmdb_api/tmdb_api.dart';

class TMDBclass {
	static ApiKeys keys = ApiKeys('f69d3de4926e09f3e28b56b471471aec', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjlkM2RlNDkyNmUwOWYzZTI4YjU2YjQ3MTQ3MWFlYyIsInN1YiI6IjVlOGIyMjNiNGQwZThkMDAxMmUxYWMxMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nqmIEcBtwibYq_LkqV1zxraUeqwbxSXHpjK_ZvN-UYo');
	TMDB tmdb = TMDB(keys);

	Future <Map<dynamic,dynamic>> getTrending() async {
		return await tmdb.v3.trending.getTrending(timeWindow: TimeWindow.week);
	}
	
}