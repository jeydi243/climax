
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';

abstract class BaseAuth {
	Future < String > signIn(String email, String password);
	Future < String > signUp(String email, String password,String nom);
    Future < String > currentUser();
	Future <void> signOut();

}
class Auth extends GetxController implements BaseAuth {
	final FirebaseAuth _fbAuth = FirebaseAuth.instance;
    final GoogleSignIn gsign = GoogleSignIn();
	// final FacebookLogin fbsign = FacebookLogin();
    dynamic user = 0.obs;
	Future <String> signIn(String email, String password) async {
		FirebaseUser user = (await _fbAuth.signInWithEmailAndPassword(email: email, password: password)).user;
		return user.uid;
	}
	Future <String> signUp(String email, String password,String nom) async {
		FirebaseUser user = (await _fbAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
		return user.uid;
	}
    Future <void> signOut() async {
		return _fbAuth.signOut();
	}
	Future <String> currentUser()async{
		FirebaseUser user = await _fbAuth.currentUser();
		return user?.uid;
	}
}