import 'package:xwallet/utils/extensions.dart';

enum BuildFlavor { dev, prod }

enum IdentificationType { nin, passport, driversLicense }

enum ConvoInputType { select, text, currency, video, file, number }

enum Source { camera, gallery }

enum Role {
  dealer,
  subDealer,
  retailer;

  @override
  String toString() {
    return super.toString().toProperCase();
  }
}

enum Telco {
  glo,
  mtn,
  airtel,
  v9Mobile;

  getId() => index + 1;
  @override
  String toString() {
    if (index == 3) return '9MOBILE';
    return name.toUpperCase();
  }
}

enum TransferType {
  bank,
  wallet;
}
