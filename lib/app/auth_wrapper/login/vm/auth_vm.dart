import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:xwallet/app/auth_wrapper/onboard/model/onboard_input_model.dart';
import 'package:xwallet/model/session.dart';
import 'package:xwallet/model/user_model.dart';
import '../../../../service/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage

class AuthVm {
  AuthVm({
    AuthService? api,
  }) {
    this.api = api ?? AuthService();
  }
  late AuthService api;
  final storage = const FlutterSecureStorage();

  Stream<UserModel?> get loggedInUser =>
      _userController.stream.asBroadcastStream();
  static final _userController = StreamController<UserModel?>();

  Stream<Session?> get currentSession =>
      _sessionController.stream.asBroadcastStream();
  static final _sessionController = StreamController<Session?>();

  Future<bool> login(String userName, String password,
      {ValueSetter<String>? onError}) async {
    await api.getAccessToken(userName, password);
    final session = await api.login(userName, password);
    if (session.hasError) {
      if (onError != null) {
        onError(session.error!);
      }
      return false;
    }
    final loggedInuser = await api.getLoggedInUser(session.data!.sessionId!);
    if (loggedInuser.hasError) {
      if (onError != null) {
        onError(loggedInuser.error!);
      }
      return false;
    }
    updateUserModel(loggedInuser.data!);
    updateSession(session.data!);
    return true;
  }

  Future<bool> refreshUserDetails(Session session) async {
    final loggedInuser = await api.getLoggedInUser(session.sessionId!);
    if (loggedInuser.hasError) return false;
    updateUserModel(loggedInuser.data!);
    return true;
  }

  Future<bool> logout(Session session) async {
    final res = await api.logout(session.sessionId!);
    if (res.hasError) return false;
    updateSession(null);
    updateUserModel(null);
    return true;
  }

  static updateUserModel(UserModel? user) {
    _userController.sink.add(user);
  }

  static updateSession(Session? session) {
    _sessionController.sink.add(session);
  }

  Future<bool> signUp(OnboardInputModel inputModel,
      {required ValueSetter<String> onError}) async {
    await api.getAccessToken('userName', 'password');
    final otpReference = await api.register(inputModel);
    if (otpReference.hasError) {
      onError(otpReference.error!);
      return false;
    }
    // encrypt and store in device
    await storage.write(key: 'username', value: inputModel.userName);
    await storage.write(key: 'otpReference', value: otpReference.data);
    return true;
  }

  Future<bool> sendOtp({int? action}) async {
    final otpReference = await storage.read(key: 'otpReference');
    final username = await storage.read(key: 'username');
    final res = await api.sendToken(
        username!, otpReference ?? const Uuid().v4(),
        action: action);
    if (res.hasError) return false;
    //replace otp refeence with new one
    await storage.write(key: 'otpReference', value: res.data);
    return true;
  }

  Future<bool> validateOtp(String tokens,
      {required ValueSetter<String> onError}) async {
    final otpReference = await storage.read(key: 'otpReference');
    final username = await storage.read(key: 'username');
    final res = await api.validateToken(tokens, username!, otpReference!);
    if (res.hasError) {
      onError(res.error!);
      return false;
    }
    storage.delete(key: 'otpReference');
    storage.delete(key: 'username');
    return true;
  }

  Future<bool> setTransactionPin(String pin, String otp,
      {required ValueSetter<String> onError}) async {
    final otpReference = await storage.read(key: 'otpReference');
    final username = await storage.read(key: 'username');
    final res = await api.setTransactionPin(username!, otpReference!, otp, pin);
    if (res.hasError) {
      onError(res.error!);
      return false;
    }
    storage.delete(key: 'otpReference');
    storage.delete(key: 'username');
    return true;
  }
}

final userProvider = StreamProvider<UserModel?>((ref) {
  return AuthVm().loggedInUser;
});
final sessionProvider = StreamProvider<Session?>((ref) {
  return AuthVm().currentSession;
});
