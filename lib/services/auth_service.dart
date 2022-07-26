import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiket_pesawat_bwa/models/user_model.dart';
import 'package:tiket_pesawat_bwa/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //tanda ! user tidak null
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String name,
      required String password,
      String hobby = ''}) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
          id: userCred.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 50000000);

      await UserService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
