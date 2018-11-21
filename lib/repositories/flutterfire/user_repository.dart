import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../kaffe_repository/lib/kaffe_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _auth;

  const FirebaseUserRepository(this._auth);

  @override
  Future<UserEntity> loginMail(String mail, String pass) async {
    final firebaseUser = await _auth.signInWithEmailAndPassword(
      email: mail,
      password: pass,
    );

    return UserEntity(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl
    );
  }

  Future<UserEntity> loginGoogle() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final firebaseUser = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return UserEntity(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
  }
}