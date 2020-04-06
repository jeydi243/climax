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
	int id = 550;
	bool adult = false;
	String backdrop_path = "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg";
	String belongs_to_collection;
	int budget = 63000000;
	List < Genre > genres = [];
	String homepage = "";
	String imdb_id = "tt0137523";
	String original_language = "en";
	String original_title = "Fight Club";
	String overview = "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on; with underground \"fight clubs\" forming in every town; until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.";
	double popularity = 0.5;
	String poster_path = null;
	List < ProductionCompanie> production_companies = [];
	List < ProductionCountrie> production_countries = [];
	String release_date = "1999-10-12";
	double revenue = 100853753;
	int runtime = 139;
	List<SpokenLanguage> spoken_languages = [];
	String status = "Released";
	String tagline = "How much can you know about yourself if you've never been in a fight?";
	String title = "Fight Club";
	bool video = false;
	double vote_average = 7.8;
	double vote_count = 3439;

}