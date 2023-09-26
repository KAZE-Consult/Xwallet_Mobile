import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/app/auth_wrapper/login/vm/auth_vm.dart';
import 'package:xwallet/model/user_model.dart';
import 'package:xwallet/service/sub_dealers_service.dart';

class SubDealersVm with ChangeNotifier {
  SubDealersVm(this.sessionId, this.userId);
  final String sessionId;
  final int userId;
  final service = SubDealersService();

  List<UserModel>? subDealers;

  getSubDealers() async {
    final res = await service.getSubDealers(sessionId);
    if (res.hasError) return;
    subDealers = res.data!;
    notifyListeners();
  }

  Future<bool> inviteSubdealer(String email, String phoneNo,
      {required ValueSetter onError}) async {
    final res = await service.inviteSubDealer(userId, email, phoneNo);
    if (res.hasError) {
      onError(res.error);
      return false;
    }
    return true;
  }

  Future<bool> deactivateSubDealer({required ValueSetter onError}) async {
    final res = await service.deactivateSubDealer(userId);
    if (res.hasError) {
      onError(res.error);
      return false;
    }
    return true;
  }
}

final subDealersVm = ChangeNotifierProvider<SubDealersVm>((ref) {
  final session = ref.read(sessionProvider).value!;
  final user = ref.read(userProvider).value!;
  return SubDealersVm(session.sessionId!, user.userId!);
});
