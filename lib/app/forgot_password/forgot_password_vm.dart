import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/service/auth_service.dart';

class ForgotPasswordVm with ChangeNotifier {
  AuthService authService = AuthService();

  Future<bool> resetPassword(String userName,
      {required ValueSetter<String> onError}) async {
    final res = await authService.resetPassword(userName);
    if (res.hasError) {
      onError(res.error!);
      return false;
    }
    return true;
  }
}

final forgotPasswordNotifier =
    ChangeNotifierProvider<ForgotPasswordVm>((ref) => ForgotPasswordVm());
