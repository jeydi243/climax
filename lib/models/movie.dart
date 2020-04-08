class Genre {
	int id = 0;
	String name = "Drama";
	Genre(this.id,this.name);
}
class ProductionCompanie {
	int id = 0;
	String logo_path = "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png";
	String name = "Regency Enterprises";
	String origin_country = "US";
	ProductionCompanie(this.id,this.logo_path,this.name,this.origin_country);
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
class Movi {
	String imdb_id = "";
	String belongs_to_collection = "";
	String homepage = "";
	String original_language = "";
	String original_title = "";
	String overview = "";
	String poster_path = null;
	String release_date = "";
	String title = "";
	String status = "";
	String tagline = "";
	List <Genre> genres = [];
	List <ProductionCompanie> production_companies = [];
	List <ProductionCountrie> production_countries = [];
	List <SpokenLanguage> spoken_languages = [];
	bool video = false;
	bool adult = false;
	int budget = 0;
	int id = 0;
	int runtime = 0;
	double revenue = 0;
	double popularity = 0.0;
	double vote_average = 0.0;
	double vote_count = 0;
	var backdrop_path = "";

	// Movie({
	// 	this.adult,
	// 	this.backdrop_path,
	// 	this.vote_count,
	// 	this.vote_average,
	// 	this.popularity,
	// 	this.revenue,
	// 	this.runtime,
	// 	this.id,
	// 	this.budget,
	// 	this.video,
	// 	this.spoken_languages,
	// 	this.production_countries,
	// 	this.production_companies,
	// 	this.genres,
	// 	this.tagline,
	// 	this.status,
	// 	this.title,
	// 	this.release_date,
	// 	this.poster_path,
	// 	this.overview,
	// 	this.original_title,
	// 	this.homepage,
	// 	this.belongs_to_collection,
	// 	this.imdb_id,
	// });

	// factory Movie.fromMap(Map map) {
	// 	return Movie(
	// 		adult: map['adult'],
	// 		backdrop_path: map['backdrop_path'],
	// 		vote_count: map['vote_count'],
	// 		vote_average: map['vote_average'],
	// 		popularity: map['popularity'],
	// 		revenue: map['revenue'],
	// 		runtime: map['runtime'],
	// 		id: map['id'],
	// 		budget: map['budget'],
	// 		video: map['video'],
	// 		spoken_languages: map['spoken_languages'],
	// 		production_countries: map['production_countries'],
	// 		production_companies: map['production_companies'],
	// 		genres: map['genres'],
	// 		tagline: map['tagline'],
	// 		status: map['status'],
	// 		title: map['title'],
	// 		release_date: map['release_date'],
	// 		poster_path: map['poster_path'],
	// 		overview: map['overview'],
	// 		original_title: map['original_title'],
	// 		homepage: map['homepage'],
	// 		belongs_to_collection: map['belongs_to_collection'],
	// 		imdb_id: map['imdb_id'],
			
	// 	);
	// }
}