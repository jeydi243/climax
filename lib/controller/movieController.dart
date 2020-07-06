import 'package:climax/Models/person.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/person_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

class MovieController extends GetxController {
  int personid;
  @override
  void onInit() async {
    super.onInit();
    Map<String, dynamic> person = Get.arguments;
    personid = person['personId'];
    print('${person['personId']}');
  }

  @override
  void onReady() {
    super.onReady();
  }

//   Future<Person> getPerson() async {
//     PersonService service = PersonService("fr-FR");
//     return await service
//         .getDetails(personid)
//         .then((mymap){
// 			return {'person': Person.Personed(mymap),"numeroGender": mymap['gender']};
// 		}).then((mysecondmap){
// 			TMBDService service = TMBDService();
// 			return {service.getGenreNameOfMovie(mysecondmap['numeroGender'])};
// 			// mysecondmap['person'].setGender = "Action";
// 			// print("Si tu est arrivé ici c'est que ::: $person");
// 		}).then((mythirdmap)  {
// 			mythirdmap['person'].setGender = genreName;
// 			return peron;
// 		}).
// 		catchError((onError,stack) => print(stack));
//   }
}
