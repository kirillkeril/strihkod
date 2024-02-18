import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/list_provider.dart';
import '../../shared/enums/errors.dart';

class AuthServiceDartProvider extends GetxService {
  signUp(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final service = ListService();
      service.createList(credential.user!.uid);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthError.weakPassword;
      }
      if (e.code == 'email-already-in-use') {
        return AuthError.userAlreadyExists;
      }
    }
  }

  signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException {
      return AuthError.wrongPassword;
    }
  }
}
