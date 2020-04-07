class Genre {
	int id = 18;
	String name = "Drama";
}
class ProductionCompanie {
	int id = 508;
	String logo_path = "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png";
	String name = "Regency Enterprises";
	String origin_country = "US";
}
class ProductionCountrie {
	String iso_3166_1 = "US";
	String name = "United States of America";
}
class SpokenLanguage {
	String iso_639_1 = "en";
	String name = "English";
}
class Movie {
	String imdb_id = "";
	String belongs_to_collection="";
	String homepage = "";
	String original_language = "";
	String original_title = "";
	String overview = "";
	String poster_path = null;
	String release_date = "";
	String title = "";
	String status = "";
	String tagline = "";
	List < Genre > genres = [];
	List < ProductionCompanie > production_companies = [];
	List < ProductionCountrie > production_countries = [];
	List < SpokenLanguage > spoken_languages = [];
	bool video = false;
	bool adult = false;
	int budget = 63000000;
	int id = 550;
	int runtime = 139;
	double revenue = 100853753;
	double popularity = 0.5;
	double vote_average = 7.8;
	double vote_count = 3439;
	var backdrop_path = "";

	Movie.fromMap()

}