import 'package:dio/dio.dart';
import 'package:xwallet/model/bank_model.dart';
import 'package:xwallet/model/send_to_x_wallet_input_model.dart';
import 'package:xwallet/model/transaction_model.dart';
import 'package:xwallet/utils/api_response.dart';
import 'package:xwallet/utils/strings.dart';
import '../model/wallet/wallet.dart';
import '../utils/endpoints.dart';

class WalletService {
  late Dio dio;
  static final _instance = WalletService._();
  WalletService._();
  factory WalletService({Dio? dio}) {
    if (dio != null) {
      _instance.dio = dio;
    }
    return _instance;
  }
  final endpoints = Endpoints();

  Future<ApiResponse<List<TransactionModel>>> getTransactionHistory(
      String sessionId) async {
    try {
      final res = await dio.get(endpoints.getTransactionHistory,
          queryParameters: {'sessionId': sessionId});
      final data = res.data['transactions'] as Iterable;
      final transactionHistory =
          data.map((e) => TransactionModel.fromMap(e)).toList();
      return ApiResponse.success(transactionHistory);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<Wallet>> fetchBalance(String sessionId) async {
    try {
      final res = await dio.get(
        endpoints.fetchBalance,
        queryParameters: {'sessionId': sessionId},
      );
      return ApiResponse.success(Wallet.fromMap(res.data));
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<List<BankModel>>> getListOfBanks() async {
    try {
      final res = await dio.get(endpoints.getBankList);
      final list = res.data as Iterable;
      return ApiResponse.success(
          list.map((e) => BankModel.fromMap(e)).toList());
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<String>> walletNameEnquiry(String walletAccountNo) async {
    try {
      final res = await dio.get(endpoints.walletNameEnquiry,
          queryParameters: {'walletAccount': walletAccountNo});
      return ApiResponse.success(res.data['fullName']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse> sendToXWallet(SendToXWalletInputModel inputModel) async {
    try {
      final res = await dio.post(
        endpoints.sendToXwallet,
        data: inputModel.toMap(),
      );
      return ApiResponse.success(res.data['message']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse> sendToBank(SendToXWalletInputModel inputModel) async {
    try {
      final res = await dio.post(
        endpoints.sendToBank,
        data: inputModel.toMap(),
      );
      return ApiResponse.success(Wallet.fromMap(res.data));
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future fundWallet() async {}
  Future createWallet(String sessionId, int serviceProvider,
      String telcoPhoneNo, String otp) async {
    try {
      final res = await dio.post(
        endpoints.createWalletAccount,
        data: {
          "sessionId": sessionId,
          "serviceProvider": serviceProvider,
          "telcoPhoneNo": telcoPhoneNo,
          "otp": otp,
        },
      );
      return ApiResponse.success(res.data['responseDescription']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<String>> sendCreateWalletToken(
      String sessionId, String phoneNo) async {
    try {
      final res = await dio.post(
        endpoints.sendTokenForCreateWallet,
        queryParameters: {
          "sessionId": sessionId,
          "serviceProvider": phoneNo,
        },
      );
      return ApiResponse.success(res.data['responseDescription']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }
}
