import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepostory {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firebaseFireStore = FirebaseFirestore.instance;

  //TODO: Eklenecek Login fonksiyonu.
  //! Geçici olarak bir veri eklendi.
  Future<List<String?>> loginUser(String email, String password) async {
    // print(email);
    // print(password);
    // if (email == "1" && password == "2") {
    //   return UserData(
    //       id: "321312312",
    //       name: "Tuğçe",
    //       surname: "Kahya",
    //       username: "tugce",
    //       email: "tugce@gmail.com");
    // } else if (email == "2" && password == "1") {
    //   return UserData(
    //       id: "3413215612",
    //       name: "Berke",
    //       surname: "Erçin",
    //       email: "berke@gmail.com",
    //       username: "berke");
    // } else {
    //   return loginUserData;
    // }
    try {
      var userCredentials = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      return ["success", userCredentials.user!.uid];
    } on FirebaseAuthException catch (e) {
      return ["error", e.message];
    }
  }

  signUpUser( String name, String surname, String email,
      String password) async {
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
  //TODO: Eklenecek Logout fonksiyonu.
}
