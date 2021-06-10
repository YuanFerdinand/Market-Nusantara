import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future signUp(String email, String password, String username) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    print("Account Created");
  }

  Future signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    print("Succes");
  }

  Future signOut() async {
    await auth.signOut();
    print("Out");
  }
}
