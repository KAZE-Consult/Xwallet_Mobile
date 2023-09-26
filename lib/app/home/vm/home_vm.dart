import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xwallet/model/send_to_x_wallet_input_model.dart';
import 'package:xwallet/model/transaction_model.dart';
import 'package:xwallet/service/auth_service.dart';
import 'package:xwallet/service/wallet_service.dart';

class HomeVm with ChangeNotifier {
  final walletService = WalletService();
  final userService = AuthService();
  List<TransactionModel> transactionHistory = [];
  SendToXWalletInputModel sendToXWalletInputModel = SendToXWalletInputModel();

  getTransactionHistory(String sessionId) async {
    print('fetching history');
    final res = await walletService.getTransactionHistory(sessionId);
    if (res.hasError) return;
    transactionHistory = res.data!.toList();
    notifyListeners();
  }

  List<TransactionModel> getTransHistoryPreview() {
    if (transactionHistory.length > 6) {
      return transactionHistory.getRange(0, 5).toList();
    }
    return transactionHistory;
  }
}

final homeVmProvider = ChangeNotifierProvider<HomeVm>((ref) => HomeVm());
