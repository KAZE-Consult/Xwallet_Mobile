import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/model/user_model.dart';
import 'package:xwallet/service/sub_dealers_service.dart';

class SubDealersVm with ChangeNotifier {
  SubDealersVm(this.sessionId);
  final String sessionId;
  final service = SubDealersService();

  List<UserModel> subDealers = [];

  getSubDealers() async {
    final res = await service.getSubDealers(sessionId);
    if (res.hasError) return;
    subDealers = res.data!;
    notifyListeners();
  }
}

final subDealersVm = ChangeNotifierProvider<SubDealersVm>((ref) {
  final session = ref.read(sessionProvider).value!;
  return SubDealersVm(session.sessionId!);
});
