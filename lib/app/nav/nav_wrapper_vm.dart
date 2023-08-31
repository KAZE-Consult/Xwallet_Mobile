import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavWrapperVm with ChangeNotifier {
  int pageIndex = 0;
  PageController pageController = PageController();
  void onPageChanged(int index) {
    pageIndex = index;
  }

  void goToPage(int index) {
    pageController.jumpToPage(index);
    pageIndex = index;
    notifyListeners();
  }
}

final navVmProvider =
    ChangeNotifierProvider<NavWrapperVm>((ref) => NavWrapperVm());
