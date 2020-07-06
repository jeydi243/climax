import 'package:climax/Models/genre.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Person {
  String _birthday;
  String _knownForDepartment;
  String _deathday;
  int _id;
  String _name;
  List<String> _alsoKnownAs = [];
  String _gender; //instead of having int we want name of genre
  String _biography;
  double _popularity;
  String _placeOfBirth;
  String _profilePath;
  bool _adult;
  String _imdId;
  String _homepage;

  String get birthday => _birthday;
  String get knownForDepartment => _knownForDepartment;
  String get deathday => _deathday;
  int get id => _id;
  String get name => _name;
  List<String> get alsoKnownAs => _alsoKnownAs;
  String get gender => _gender; //instead of having int we want name of genre
  String get biography => _biography;
  double get popularity => _popularity;
  String get placeOfBirth => _placeOfBirth;
  String get profilePath => _profilePath;
  bool get adult => _adult;
  String get imdId => _imdId;
  String get homepage => _homepage;

  set setGender(String gender) {
    _gender = gender;
  }

  Person._(
      {id,
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
      homepage});

  static Person Personed(Map<dynamic, dynamic> map) {
    return Person._(
      adult: map['adult'],
      alsoKnownAs: map['also_known_as'],
      biography: map['biography'],
      birthday: map['birthday'],
      deathday: map['deathday'],
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
