class Genre {
	int id = 0;
	String name = "Drama";
	Genre(this.id,this.name);
}

class ProductionCountrie {
	String iso_3166_1 = "US";
	String name = "United States of America";
	ProductionCountrie(this.iso_3166_1,this.name);
}
class SpokenLanguage {
	String iso_639_1 = "";
	String name = "";
	SpokenLanguage(this.iso_639_1,this.name);
}
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
	List <ProductionCompanie> _production_companies = [];
	List <ProductionCountrie> _production_countries = [];
	List <SpokenLanguage> _spoken_languages = [];
	bool _video = false;
	bool _adult = false;

	double _revenue = 0;
	double _popularity = 0.0;
	double _vote_average = 0.0;
	double _vote_count = 0;
	List _backdrop_path = "";

	Movie({
		this._adult,
		this._backdrop_path,
		this.vote_count,
		this.vote_average,
		this.popularity,
		this._revenue,
		this._runtime,
		this._id,
		this._budget,
		this._video,
		this._spoken_languages,
		this._production_countries,
		this._production_companies,
		this._genres,
		this._tagline,
		this._status,
		this._title,
		this._release_date,
		this._poster_path,
		this._overview,
		this._original_title,
		this._homepage,
		this.belongs_to_collection,
		this.imdb_id});

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