import 'dart:convert';

import 'telco_balance.dart';

class Wallet {
  String? walletAccount;
  double? walletBalance;
  List<TelcoBalance>? telcoBalance;

  Wallet({this.walletAccount, this.walletBalance, this.telcoBalance});

  @override
  String toString() {
    return 'Wallet(walletAccount: $walletAccount, walletBalance: $walletBalance, telcoBalance: $telcoBalance)';
  }

  factory Wallet.fromMap(Map<String, dynamic> data) => Wallet(
        walletAccount: data['walletAccount'] as String?,
        walletBalance: data['walletBalance'] as double?,
        telcoBalance: (data['telcoBalance'] as List<dynamic>?)
            ?.map((e) => TelcoBalance.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'walletAccount': walletAccount,
        'walletBalance': walletBalance,
        'telcoBalance': telcoBalance?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Wallet].
  factory Wallet.fromJson(String data) {
    return Wallet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Wallet] to a JSON string.
  String toJson() => json.encode(toMap());

  Wallet copyWith({
    String? walletAccount,
    double? walletBalance,
    List<TelcoBalance>? telcoBalance,
  }) {
    return Wallet(
      walletAccount: walletAccount ?? this.walletAccount,
      walletBalance: walletBalance ?? this.walletBalance,
      telcoBalance: telcoBalance ?? this.telcoBalance,
    );
  }
}
