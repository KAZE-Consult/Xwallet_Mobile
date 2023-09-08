import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardVm with ChangeNotifier {
  String? selectedRole;

  selectRole(String? val) {
    selectedRole = val;
    notifyListeners();
  }
}

final onboardVmProvider = ChangeNotifierProvider<OnBoardVm>((ref) {
  return OnBoardVm();
});
