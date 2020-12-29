import 'package:climax/Models/companie.dart';

class Movie {
	int _budget;
	int _id;
	int _runtime;
	int _voteCount;
	String _imdbId;
	String _belongsToCollection;
	String _homePage;
	String _originalLanguage;
	String _originalTitle;
	String _overview;
	String _releaseDate;
	String _title;
	String _status;
	String _tagline;
	List < int > _genres = <int>[];
	List < Companie > _productionCompanies = <Companie>[] ;
	List < String > _productionCountries = <String>[];
	List < String > _spokenLanguages= <String>[];
	bool _video = false;
	bool _adult = false;
	double _revenue;
	double _popularity;
	dynamic _voteAverage;
	String _posterPath;
	String _backdropPath;
	Map _images={};
	Map _videos={};

	int get budget => _budget;
	int get id => _id;
	int get runtime => _runtime;
	String get imdbId => _imdbId;
	String get belongsToCollection => _belongsToCollection;
	String get originalLanguage => _originalLanguage;
	String get originalTitle => _originalTitle;
	String get overview => _overview;
	String get releaseDate => _releaseDate;
	String get title => _title;
	String get status => _status;
	String get tagline => _tagline;
	List < int > get genres => _genres;
	List < Companie > get productionCompanies => _productionCompanies;
	List < String > get productionCountries => _productionCountries;
	List < String > get spokenLanguages => _spokenLanguages;
	bool get video => _video;
	bool get adult => _adult;

	double get revenue => _revenue;
	double get popularity => _popularity;
	dynamic get voteAverage => _voteAverage;
	int get voteCount => _voteCount;
	String get posterPath => _posterPath;
	String get backdropPath => _backdropPath;
	Map get Images => _images;
	Map get Videos => _videos;

	set setImages(Map images){
       _images = images;
	}
	set setVideos(Map videos){
       _videos = videos;
	}

	// @override
	// String toString() {
	// 	return "* ${this._genres[0]}: ${this._title}";
	// }

	Movie({
		adult,
		backdropPath,
		voteCount,
		voteAverage,
		popularity,
		revenue,
		runtime,
		id,
		budget,
		video,
		spokenLanguages,
		productionCountries,
		productionCompanies,
		genres,
		tagline,
		status,
		title,
		releaseDate,
		posterPath,
		overview,
		originalTitle,
		homepage,
		belongsToCollection,
		imdbId
	});

	Movie.fromMap(Map <String, dynamic> map) {
		this._adult = map['adult'];
		this._backdropPath = map['backdrop_path'];
		this._voteCount = map['vote_count'];
		this._voteAverage = map['vote_average'];
		this._popularity = map['popularity'];
		this._revenue = map['revenue'];
		this._runtime = map['runtime'];
		this._id = map['id'];
		this._budget = map['budget'];
		this._video = map['video'];
		this._spokenLanguages = map['spoken_languages'];
		this._productionCountries = map['production_countries'];
		this._productionCompanies = map['production_companies'];
		// for(Map<String,dynamic> fr in map['genres']) { };
		this._genres = [...map['genre_ids']];
		this._tagline = map['tagline'];
		this._status = map['status'];
		this._title = map['title'];
		this._releaseDate = map['release_date'];
		this._posterPath = map['poster_path'];
		this._overview = map['overview'];
		this._originalTitle = map['original_title'];
		this._homePage = map['homepage'];
		this._belongsToCollection = map['belongs_to_collection'];
		this._imdbId = map['imdb_id'];
	}
}