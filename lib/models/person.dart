import 'package:climax/Models/genre.dart';
import 'package:climax/services/TMBDService.dart';

class Person {
	String birthday;
	String _knownForDepartment;
	String _deathday;
	int _id;
	String _name;
	List < String > _alsoKnownAs = [];
	String _gender; //instead of having int we want name of genre
	String _biography;
	double _popularity;
	String _placeOfBirth;
	String _profilePath;
	bool _adult;
	String _imdId;
	String _homepage;

	Person._({
		id,
		birthday,
		knownForDepartment,
		deathday,
		name,
		alsoKnownAs,
		gender,
		biography,
		popularity,
		placeOfBirth,
		profilePath,
		adult,
		imdId,
		homepage
	});

	static Future<Person> Personed(Map < dynamic, dynamic > map)async {
		TMBDService service = new TMBDService();
		String genres = await service.getGenreNameOfMovie(map['gender']);
		return new Person._(
			adult: map['adult'],
			alsoKnownAs: map['also_known_as'],
			biography: map['biography'],
			birthday: map['birthday'],
			deathday: map['deathday'],
			gender: genres,
			homepage: map['homepage'],
			id: map['id'],
			imdId: map['imdb_id'],
			knownForDepartment: map['known_for_department'],
			name: map['name'],
			placeOfBirth: map['place_of_birth'],
			popularity: map['popularity'],
			profilePath: map['profile_path'],
		);
	}
}