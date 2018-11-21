import 'dart:async';

import 'package:kaffe_repository/src/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> loginMail(String mail, String pass);
  Future<UserEntity> loginGoogle();
}
