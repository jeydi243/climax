import 'package:climax/models/genre.dart';
import 'package:climax/services/tmdb_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Person {
  String _birthday;
  String _knownForDepartment;
  String _deathday;
  int _id;
  String _name;
  List<String> _alsoKnownAs = new List<String>();
  Map<String,dynamic> _CombinedCredit = Map<String,dynamic>();
  String _gender; //instead of having int we want name of genre ex: 'Action'
  String _biography;
  double _popularity;
  String _placeOfBirth;
  String _profilePath;
  bool _adult;
  String _imdId;
  String _homepage;
  Map _Images;

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
  Map get combinedCredits => _CombinedCredit;

  set setGender(String gender) {
    _gender = gender;
  }
  set setCombinedCredits(Map mycredit){
	  _CombinedCredit = mycredit;
  }
  set setImages(Map myImages){
     _Images = myImages;
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

    Person.personed(Map<dynamic, dynamic> map,String genre) {
      _adult= map['adult'];
      _alsoKnownAs= map['also_known_as'].cast<String>();
      _biography= map['biography'];
      _birthday= map['birthday'];
      _deathday= map['deathday'];
      _homepage= map['homepage'];
      _id= map['id'];
      _imdId= map['imdb_id'];
      _knownForDepartment= map['known_for_department'];
      _name= map['name'];
      _placeOfBirth= map['place_of_birth'];
      _popularity= map['popularity'].toDouble();
      _profilePath= map['profile_path'];
	  _gender= genre;
    
  }
}
