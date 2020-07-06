import 'package:climax/Models/person.dart';
import 'package:climax/services/TMBDService.dart';
import 'package:climax/services/person_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
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

  Future<Person> getPerson() async {
    PersonService service = PersonService("fr-FR");
    return await service
        .getDetails(personid)
        .then((mymap){
			return Person.Personed(mymap, genre: mymap['gender'] );
		}).catchError((onError,stack) => print(stack));
  }
}
