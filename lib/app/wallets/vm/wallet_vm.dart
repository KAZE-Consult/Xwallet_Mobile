import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:xwallet/model/bank_model.dart';
import 'package:xwallet/model/send_to_x_wallet_input_model.dart';
import 'package:xwallet/model/wallet/wallet.dart';
import 'package:xwallet/service/wallet_service.dart';

import '../../auth_wrapper/login/vm/auth_vm.dart';

class WalletVm with ChangeNotifier {
  WalletVm(this.sessionId);
  final String sessionId;
  final walletService = WalletService();
  Wallet? wallet;
  SendToXWalletInputModel sendToXWalletInputModel = SendToXWalletInputModel();
  List<BankModel>? banks;

  String? destWalletName;

  setTransType(int? val) {
    sendToXWalletInputModel.transferType = val.toString();
  }

  setSenderAccountNo(String val) {
    sendToXWalletInputModel.fromAcctNo = val;
  }

  setDestAccountNo(String val) {
    sendToXWalletInputModel.toAcctNo = val;
  }

  setAmount(String val) {
    sendToXWalletInputModel.amount = int.parse(val);
  }

  setNarration(String val) {
    sendToXWalletInputModel.naration = val;
  }

  setPin(String val) {
    sendToXWalletInputModel.pin = val;
  }

  walletNameEnquiry(String walletAccountNo) async {
    final res = await walletService.walletNameEnquiry(walletAccountNo);
    if (res.hasError) {
      return;
    }
    destWalletName = res.data!;
    notifyListeners();
  }

  getWallet(String sessionId) async {
    final res = await walletService.fetchBalance(sessionId);
    if (res.hasError) return;
    wallet = res.data;
    notifyListeners();
  }

  getBankList() async {
    final res = await walletService.getListOfBanks();
    if (res.hasError) {
      return;
    }
    banks = res.data;
    notifyListeners();
  }

  Future<bool> sendMoneyToWallet(
      {required VoidCallback onSuccess, required VoidCallback onError}) async {
    final res = await walletService.sendToXWallet(
      sendToXWalletInputModel.copyWith(
        requestId: const Uuid().v4(),
        referenceId: 'mobile_${const Uuid().v4()}',
      ),
    );
    if (res.hasError) {
      onError();
      return false;
    }
    destWalletName = null;
    onSuccess();
    return true;
  }

  Future<bool> sendMoneyToBank(
      {required VoidCallback onSuccess, required VoidCallback onError}) async {
    final res = await walletService.sendToXWallet(
      sendToXWalletInputModel.copyWith(
        requestId: const Uuid().v4(),
        referenceId: 'mobile_${const Uuid().v4()}',
      ),
    );
    if (res.hasError) {
      onError();
      return false;
    }
    destWalletName = null;
    onSuccess();
    return true;
  }

  createWalletAccount(
      {required int serviceProvider,
      required String telcoPhoneNo,
      required String otp}) async {}

  Future<bool> sendCreateWalletToken(String phoneNo) async {
    final res = await walletService.sendCreateWalletToken(sessionId, phoneNo);
    if (res.hasError) return false;
    return true;
  }

  clear() {
    sendToXWalletInputModel = SendToXWalletInputModel();
  }
}

final walletVmProvider = ChangeNotifierProvider<WalletVm>((ref) {
  final session = ref.read(sessionProvider).value!;
  return WalletVm(session.sessionId!);
});
