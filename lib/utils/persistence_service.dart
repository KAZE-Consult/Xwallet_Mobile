// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class PersistenceService {
//   final storage = const FlutterSecureStorage();
//   saveAuthDetails(String userName, String password) {
//     storage.write(key: 'userName', value: userName);
//     storage.write(key: 'password', value: password);
//   }

//   Future<Map<String, String>?> getAuthDetails() async {
//     String? password = await storage.read(key: 'password');
//     String? userName = await storage.read(key: 'userName');
//     if (password == null || userName == null) {
//       return null;
//     }
//     return {
//       'userName': userName,
//       'password': password,
//     };
//   }
// }
