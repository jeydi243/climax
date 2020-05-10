import 'package:climax/Models/genre.dart';
import 'package:climax/Models/companie.dart';

class Movie {
  int _budget = 0;
	int _id = 0;
	int _runtime = 0;
	String _imdb_id = "";
	String _belongs_to_collection = "";
	String _homepage = "";
	String _original_language = "";
	String _original_title = "";
	String _overview = "";
	String _poster_path = null;
	String _release_date = "";
	String _title = "";
	String _status = "";
	String _tagline = "";
	List <Genre> _genres = [];
	List <Companie> _production_companies = [];
	List <String> _production_countries = [];
	List <String> _spoken_languages = [];
	bool _video = false;
	bool _adult = false;

	double _revenue = 0;
	double _popularity = 0.0;
	double _vote_average = 0.0;
	double _vote_count = 0;
	List _backdrop_path = [""];

	Movie({
		adult,
		backdrop_path,
		vote_count,
		vote_average,
		popularity,
		revenue,
		runtime,
		id,
		budget,
		video,
		spoken_languages,
		production_countries,
		production_companies,
		genres,
		tagline,
		status,
		title,
		release_date,
		poster_path,
		overview,
		original_title,
		homepage,
		belongs_to_collection,
		imdb_id});

	factory Movie.fromMap(Map<String,dynamic> map) {
		return Movie(
			adult: map['adult'],
			backdrop_path: map['backdrop_path'],
			vote_count: map['vote_count'],
			vote_average: map['vote_average'],
			popularity: map['popularity'],
			revenue: map['revenue'],
			runtime: map['runtime'],
			id: map['id'],
			budget: map['budget'],
			video: map['video'],
			spoken_languages: map['spoken_languages'],
			production_countries: map['production_countries'],
			production_companies: map['production_companies'],
			genres: map['genres'],
			tagline: map['tagline'],
			status: map['status'],
			title: map['title'],
			release_date: map['release_date'],
			poster_path: map['poster_path'],
			overview: map['overview'],
			original_title: map['original_title'],
			homepage: map['homepage'],
			belongs_to_collection: map['belongs_to_collection'],
			imdb_id: map['imdb_id'],
			
		);
	}
}