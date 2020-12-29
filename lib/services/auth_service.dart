import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

abstract class BaseAuth {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> register(String email, String password, String nom);
  Future<User> currentUser();
  Future<void> signOut();
}

class Auth extends GetxController implements BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn gsign = GoogleSignIn();
  User user ;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
	    try{
			await _auth.signInWithEmailAndPassword(email: email, password: password).then((usercredential){
				user = usercredential.user;
			});
			print("User is: $user");
			return user;

	    } on FirebaseAuthException catch (e){
			print("${e.code} : ${e.message}");
	    }
  }

  Future<User> register(String email, String password, String nom) async {
	  try{
			await _auth.createUserWithEmailAndPassword(email: email, password: password).then((usercredential){
				user = usercredential.user;
			});
			print("User is: $user");
			return user;

	    } on FirebaseAuthException catch (e){
			print("${e.code} : ${e.message}");
	    }
  }

  Future<GoogleSignInAccount> signOut() async {
    return gsign.signOut();
  }

  Future<User> currentUser() async {
	  try{
    	user = await _auth.currentUser;
		return user;
	  }on FirebaseException catch (e){
		  print(e.message);
	  }
    
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await gsign.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);
    user = authResult.user;
	print("User is: $user");
    return user;
  }

  Future<bool> get gsignState => gsign.isSignedIn();
  Stream<User> authStateChange(){
	  _auth.authStateChanges().listen((User user) {
		  if(user != null){
			  return user;
		  }
		  else{
			  return null;
		  }
	   });
  }
  User get getUser => user;
}
