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
        return 'https://staging-api-core.evoluticstech.com';
      case BuildFlavor.prod:
        return 'https://staging-api-core.evoluticstech.com';
    }
  }

  String get validateClientExistsByPhoneNoAndEmail =>
      '/core/rest/client/exists';
  String get createIndividualClient => '/core/rest/client/individual';
  String get viewClientInformationByClientNo => '/core/rest/client/view';
  String get systemLogin => '/core/rest/authentication/login';
  String get getWebAccessByClientNo => '/core/rest/client/web_access';
  String get webAccessLogin => '/core/rest/web/access/login';
  String get createWebAccess => '/core/rest/web/access';
  String get searchPolicies => '/core/rest/policy/search';
  String get getCodeAndTitleByCodeSubgroupAndCodeCat =>
      '/core/rest/codes/sub/category';
  String get getAllPolicyCoversByPolicyNoAndPolicyCode =>
      '/core/rest/policy/covers/view';
  String get getVehicleDetailsFromAutoReg => '/core/rest/asset/autoreg';
  String get getProductCoversByProductCode => '/core/rest/product/code/covers';
  String get calculateScenarioPremium =>
      '/core/rest/policy/calculate/scenario/premium';
  String get getProductBasicByProductCode => '/core/rest/product/basic';
  String get updateClientContact => '/core/rest/client/contact';
  String get saveClaim => '/core/rest/v2/claim/';
  String get processForgotPasswordBeforeLoginAndSendNotification =>
      '/core/rest/web/access/forgot-password/notification';
}
