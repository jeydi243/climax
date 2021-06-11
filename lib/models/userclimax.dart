import 'package:cloud_firestore/cloud_firestore.dart';

class UserClimax {
  String _id;
  String _name;
  String _email;
  String _telephone;
  String _provider;
  String _imgsrc;
  var _creation;
  List<DocumentReference> _filmsFavs;
  List<DocumentReference> _seriesFavs;

//getters
  String get nom => _name;
  String get id => _id;
  String get imgsrc => _imgsrc;
  String get provider => _provider;
  String get email => _email;
  String get telephone => _telephone;
  get creation => _creation;
  List<DocumentReference> get filmFavs => _filmsFavs;
  List<DocumentReference> get serieFavs => _seriesFavs;


//setters
  set setImage(String url) {
    _imgsrc = url;
  }

  set telephone(String telephone) {
    _telephone = telephone;
  }

  // ignore: unnecessary_getters_setters
  set nom(String nom) {
    _name = nom;
  }

  @override
  String toString() {
    return "$nom,$email,$imgsrc,$creation, $provider, ID:$id";
  }

  UserClimax.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _imgsrc = map['imgsrc'];
    _email = map['email'];
    _telephone = map['telephone'];
    _provider = map['provider'];
    _creation = map['creation'];

    dynamic test1 = map['filmsFavs'].toList();
    _filmsFavs = List<DocumentReference>.from(test1);

    dynamic test2 = map['seriesFavs'].toList();
    _seriesFavs = List<DocumentReference>.from(test2);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': nom,
      'imgsrc': imgsrc,
    };
  }
}
