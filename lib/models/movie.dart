import 'package:climax/Models/companie.dart';

class Movie {
	int _budget;
	int _id;
	int _runtime;
	int _vote_count;
	String _imdb_id;
	String _belongs_to_collection;
	String _homepage;
	String _original_language;
	String _original_title;
	String _overview;
	String _release_date;
	String _title;
	String _status;
	String _tagline;
	List < int > _genres = <int>[];
	List < Companie > _production_companies = <Companie>[] ;
	List < String > _production_countries = <String>[];
	List < String > _spoken_languages= <String>[];
	bool _video = false;
	bool _adult = false;
	double _revenue;
	double _popularity;
	double _vote_average;
	String _poster_path;
	String _backdrop_path;

	int get budget => _budget;
	int get id => _id;
	int get runtime => _runtime;
	String get imdb_id => _imdb_id;
	String get belongs_to_collection => _belongs_to_collection;
	String get homepage => _homepage;
	String get original_language => _original_language;
	String get original_title => _original_title;
	String get overview => _overview;
	String get release_date => _release_date;
	String get title => _title;
	String get status => _status;
	String get tagline => _tagline;
	List < int > get genres => _genres;
	List < Companie > get production_companies => _production_companies;
	List < String > get production_countries => _production_countries;
	List < String > get spoken_languages => _spoken_languages;
	bool get video => _video;
	bool get adult => _adult;

	double get revenue => _revenue;
	double get popularity => _popularity;
	double get vote_average => _vote_average;
	int get vote_count => _vote_count;
	String get poster_path => _poster_path;
	String get backdrop_path => _backdrop_path;

	@override
	String toString() {
		return "* ${this._genres[0]}: ${this._title}";
	}

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
		imdb_id
	});

	Movie.fromMap(Map <String, dynamic> map) {
		this._adult = map['adult'];
		this._backdrop_path = map['backdrop_path'];
		this._vote_count = map['vote_count'];
		this._vote_average = map['vote_average'];
		this._popularity = map['popularity'];
		this._revenue = map['revenue'];
		this._runtime = map['runtime'];
		this._id = map['id'];
		this._budget = map['budget'];
		this._video = map['video'];
		this._spoken_languages = map['spoken_languages'];
		this._production_countries = map['production_countries'];
		this._production_companies = map['production_companies'];
		// for(Map<String,dynamic> fr in map['genres']) { };
		this._genres = [...map['genre_ids']];
		this._tagline = map['tagline'];
		this._status = map['status'];
		this._title = map['title'];
		this._release_date = map['release_date'];
		this._poster_path = map['poster_path'];
		this._overview = map['overview'];
		this._original_title = map['original_title'];
		this._homepage = map['homepage'];
		this._belongs_to_collection = map['belongs_to_collection'];
		this._imdb_id = map['imdb_id'];
	}
}