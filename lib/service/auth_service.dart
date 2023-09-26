import 'package:dio/dio.dart';
import 'package:xwallet/app/auth_wrapper/onboard/model/onboard_input_model.dart';
import 'package:xwallet/model/auth_details.dart';
import 'package:xwallet/model/user_model.dart';
import 'package:xwallet/model/session.dart';
import 'package:xwallet/service/sub_dealers_service.dart';
import 'package:xwallet/service/wallet_service.dart';
import 'package:xwallet/utils/api_response.dart';
import 'package:xwallet/utils/endpoints.dart';
import 'package:xwallet/utils/strings.dart';

class AuthService {
  late Dio dio;
  static final _instance = AuthService._();
  AuthService._();
  factory AuthService({Dio? dio}) {
    if (dio != null) {
      _instance.dio = dio;
      WalletService(dio: dio);
      SubDealersService(dio: dio);
    }
    return _instance;
  }
  final endpoints = Endpoints();

  Future<ApiResponse<AuthDetails>> getAccessToken(
      String userName, String password) async {
    try {
      final result = await dio.post(
        endpoints.tokenLogin,
        data: {"userName": "testing", "password": "1234"},
      );
      final authDetails = AuthDetails.fromMap(result.data);
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${authDetails.accessToken}';
          handler.next(options);
        },
      ));
      return ApiResponse.success(authDetails);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<Session>> login(String userName, String password) async {
    try {
      final res = await dio.post(endpoints.login,
          // data: {"userName": "jacobian2", "password": "1234"});
          data: {"userName": userName, "password": password});
      final session = Session.fromMap(res.data);
      return ApiResponse.success(session);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<String>> register(OnboardInputModel input) async {
    try {
      final res = await dio.post(endpoints.register, data: input.toMap());
      if (res.data['responseCode'] != '00') {
        return ApiResponse.error(res.data['responseDescription']);
      }
      return ApiResponse.success(res.data['otpReference']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<String>> sendToken(String username, String otpReference,
      {int? action}) async {
    try {
      final res = await dio.post(
        endpoints.sendToken,
        data: {
          "username": username,
          "referenceId": otpReference,
          "action": action ?? 0
        },
      );
      return ApiResponse.success(res.data['otpReference']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<String>> validateToken(
      String tokens, String username, String otpReference) async {
    try {
      final res = await dio.post(
        endpoints.validateToken,
        data: {
          "otpReference": otpReference,
          "userName": username,
          "tokens": tokens,
        },
      );
      return ApiResponse.success(res.data['responseDescription']);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<UserModel>> getLoggedInUser(String sessionId) async {
    try {
      final res = await dio.get(endpoints.fetchUserDetails,
          queryParameters: {'sessionId': sessionId});
      final dealerDetails = UserModel.fromMap(res.data);
      return ApiResponse.success(dealerDetails);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<bool>> logout(String sessionId) async {
    try {
      final res = await dio.get(
        endpoints.logout,
        queryParameters: {'sessionId': sessionId},
      );
      return ApiResponse.success(true);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<bool>> setTransactionPin(
      String userName, String otpReference, String otp, String pin) async {
    try {
      final res = await dio.post(
        endpoints.setTransactionPin,
        data: {
          "userName": userName,
          "pin": pin,
          "otpReference": otpReference,
          "otp": otp,
        },
      );
      if (res.data['responseCode'] != '00') {
        return ApiResponse.error(res.data['responseDescription']);
      }
      return ApiResponse.success(true);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<bool>> changePassword(
      String userName, String oldPassword, String newPassword) async {
    try {
      final res = await dio.post(
        endpoints.changePassword,
        data: {
          "userName": userName,
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
      );
      if (res.data['responseCode'] != '00') {
        return ApiResponse.error(res.data['responseDescription']);
      }
      return ApiResponse.success(true);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }

  Future<ApiResponse<bool>> resetPassword(String userName) async {
    try {
      await getAccessToken('', '');
      final res = await dio.post(
        endpoints.resetPassword,
        queryParameters: {"userName": userName},
      );
      if (res.data['responseCode'] != '00') {
        return ApiResponse.error(res.data['responseDescription']);
      }
      return ApiResponse.success(true);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }
}
