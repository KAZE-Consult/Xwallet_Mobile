import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/model/user_model.dart';

import '../../../../service/auth_service.dart';

class AuthVm {
  AuthVm({
    AuthService? api,
  }) {
    this.api = api ?? const AuthService();
  }
  late AuthService api;
  Stream<UserModel?> get user => _streamController.stream.asBroadcastStream();

  static final _streamController = StreamController<UserModel?>();

  Future<bool> login(String userName, String password) async {
    updateUser(UserModel(id: 'id'));
    return true;
  }

  static updateUser(UserModel user) {
    _streamController.sink.add(user);
  }

  Future<bool> signUp() async {
    return true;
  }
}

final userProvider = StreamProvider<UserModel?>((ref) {
  return AuthVm().user;
});
