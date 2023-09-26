import 'enums.dart';

class Endpoints {
  static final _instance = Endpoints._();
  late BuildFlavor flavor;
  Endpoints._();
  factory Endpoints({BuildFlavor? flavor}) {
    if (flavor != null) {
      _instance.flavor = flavor;
    }
    return _instance;
  }

  String get baseUrl {
    switch (flavor) {
      case BuildFlavor.dev:
        return 'https://api.xwalletapp.org/api/';
      case BuildFlavor.prod:
        return 'https://staging-api-core.evoluticstech.com';
    }
  }

  String get tokenLogin => 'api/Authentication/tokenLogin';
  String get login => 'api/login/login';
  String get logout => 'api/login/logOut';
  String get fetchUserDetails => 'api/users/fetchDetails';
  String get register => 'api/Registration/basicRegisterDealer';
  String get sendToken => 'api/Registration/sendToken';
  String get validateToken => 'api/Registration/validateToken';
  String get getTransactionHistory => 'api/users/getTransactionHistory';
  String get fetchBalance => 'api/users/fetchBalance';
  String get sendToXwallet => 'api/Transaction/sendToXwallet';
  String get sendToBank => 'api/Transaction/walletToBank';
  String get getBankList => 'api/Transaction/getListOfBank';
  String get walletNameEnquiry => 'api/Transaction/walletNameEnquiry';
  String get sendTokenForCreateWallet =>
      'api/Registration/sendTokenForCreateWallet';
  String get createWalletAccount => 'api/users/createWalletAccount';
  String get fetchListOfSubdealers => 'api/subdealers/fetchListOfSubdealers';
  String get inviteSubDealer => 'api/subdealers/inviteSubDealer';
  String get deactivateSubDealer => 'api/subdealers/deactivateSubdealers';
  String get setTransactionPin => 'api/Transaction/setTransactionPin';
  String get resetPassword => 'api/login/resetPassword';
  String get changePassword => 'api/login/changePassword';
}
