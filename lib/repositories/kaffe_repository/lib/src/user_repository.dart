import 'dart:async';

import 'package:kaffe_repository/src/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> signinMail(String mail, String pass);
  Future<UserEntity> signupMail(String mail, String pass);
  Future<UserEntity> signinGoogle();
}


