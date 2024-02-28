import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepostory {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firebaseFireStore = FirebaseFirestore.instance;

  Future<List<String?>> loginUser(String email, String password) async {
    try {
      var userCredentials = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      return ["success", userCredentials.user!.uid];
    } on FirebaseAuthException catch (e) {
      return ["error", e.message];
    }
  }

  signUpUser(String name, String surname, String email, String password) async {
    final userCredentials = await firebaseAuthInstance
        .createUserWithEmailAndPassword(email: email, password: password);
    var user =
        firebaseFireStore.collection("users").doc(userCredentials.user!.uid);
    await user.set({
      "userId": userCredentials.user!.uid,
      "name": name,
      "surname": surname,
      "email": email,
    });
  }

  logoutUser() {
    firebaseAuthInstance.signOut();
  }
}
