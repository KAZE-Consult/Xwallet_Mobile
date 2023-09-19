import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/onboard/model/onboard_input_model.dart';
import 'package:xwallet/utils/helper_functions.dart';

class OnBoardVm with ChangeNotifier {
  OnboardInputModel onboardInput = OnboardInputModel();
  bool isLoading = false;

  setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  setFirstName(String val) {
    onboardInput.firstName = val;
    notifyListeners();
  }

  setLastName(String val) {
    onboardInput.lastName = val;
    notifyListeners();
  }

  setUserName(String val) {
    onboardInput.userName = val;
    notifyListeners();
  }

  setEmailAddress(String val) {
    onboardInput.emailAddress = val;
    notifyListeners();
  }

  setPersonalPhoneNo(String val) {
    onboardInput.phoneNo = val;
    notifyListeners();
  }

  setServiceProvider(int? val) {
    onboardInput.serviceProvider = 0;
    notifyListeners();
  }

  setSuperSimPhoneNo(String val) {
    onboardInput.superSimPhoneNo = val;
    notifyListeners();
  }

  setPassword(String val) {
    onboardInput.password = val;
    notifyListeners();
  }

  selectRole(int? val) {
    onboardInput.roleId = val;
    notifyListeners();
  }

  bool validatePage1() {
    if (onboardInput.firstName == null) return false;
    if (onboardInput.firstName!.isEmpty) return false;
    if (onboardInput.lastName == null) return false;
    if (onboardInput.lastName!.isEmpty) return false;
    if (onboardInput.emailAddress == null) return false;
    if (onboardInput.emailAddress!.isEmpty) return false;
    if (!validateEmail(onboardInput.emailAddress!)) return false;
    if (onboardInput.roleId == null) return false;
    return true;
  }

  bool validatePage2(bool isDealer) {
    if (isDealer) {
      if (onboardInput.serviceProvider == null) return false;
      if (onboardInput.superSimPhoneNo == null) return false;
      if (onboardInput.superSimPhoneNo!.length < 11) return false;
    } else {
      if (onboardInput.phoneNo == null) return false;
      if (onboardInput.phoneNo!.length < 11) return false;
    }
    if (onboardInput.userName == null) return false;
    if (onboardInput.userName!.isEmpty) return false;
    if (onboardInput.password == null) return false;
    if (onboardInput.password!.isEmpty) return false;
    return true;
  }
}

final onboardVmProvider = ChangeNotifierProvider<OnBoardVm>((ref) {
  return OnBoardVm();
});
