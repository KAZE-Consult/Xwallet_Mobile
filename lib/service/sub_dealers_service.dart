import 'package:dio/dio.dart';
import 'package:xwallet/model/user_model.dart';
import 'package:xwallet/utils/strings.dart';

import '../utils/api_response.dart';
import '../utils/endpoints.dart';

class SubDealersService {
  late Dio dio;
  static final _instance = SubDealersService._();
  SubDealersService._();
  factory SubDealersService({Dio? dio}) {
    if (dio != null) {
      _instance.dio = dio;
    }
    return _instance;
  }
  final endpoints = Endpoints();

  Future<ApiResponse<List<UserModel>>> getSubDealers(String sessionId) async {
    try {
      final res = await dio.get(
        endpoints.fetchListOfSubdealers,
        queryParameters: {'sessionId': sessionId},
      );
      final list =
          (res.data as Iterable).map((e) => UserModel.fromMap(e)).toList();
      return ApiResponse.success(list);
    } catch (e) {
      return ApiResponse.error(anErrorOccured);
    }
  }
}
