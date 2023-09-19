import 'dart:convert';

class TelcoBalance {
  int? id;
  int? userId;
  int? serviceProvider;
  dynamic telcoPhoneNo;
  String? walletAccount;
  String? telcoWalletAccount;
  String? status;
  double? dataBalance;
  double? airtimeBalance;
  String? createdDate;
  String? updatedDate;

  TelcoBalance({
    this.id,
    this.userId,
    this.serviceProvider,
    this.telcoPhoneNo,
    this.walletAccount,
    this.telcoWalletAccount,
    this.status,
    this.dataBalance,
    this.airtimeBalance,
    this.createdDate,
    this.updatedDate,
  });

  @override
  String toString() {
    return 'TelcoBalance(id: $id, userId: $userId, serviceProvider: $serviceProvider, telcoPhoneNo: $telcoPhoneNo, walletAccount: $walletAccount, telcoWalletAccount: $telcoWalletAccount, status: $status, dataBalance: $dataBalance, airtimeBalance: $airtimeBalance, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  factory TelcoBalance.fromMap(Map<String, dynamic> data) => TelcoBalance(
        id: data['id'] as int?,
        userId: data['userId'] as int?,
        serviceProvider: data['serviceProvider'] as int?,
        telcoPhoneNo: data['telcoPhoneNo'] as dynamic,
        walletAccount: data['walletAccount'] as String?,
        telcoWalletAccount: data['telcoWalletAccount'] as String?,
        status: data['status'] as String?,
        dataBalance: data['dataBalance'] as double?,
        airtimeBalance: data['airtimeBalance'] as double?,
        createdDate: data['createdDate'] as String?,
        updatedDate: data['updatedDate'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'serviceProvider': serviceProvider,
        'telcoPhoneNo': telcoPhoneNo,
        'walletAccount': walletAccount,
        'telcoWalletAccount': telcoWalletAccount,
        'status': status,
        'dataBalance': dataBalance,
        'airtimeBalance': airtimeBalance,
        'createdDate': createdDate,
        'updatedDate': updatedDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TelcoBalance].
  factory TelcoBalance.fromJson(String data) {
    return TelcoBalance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TelcoBalance] to a JSON string.
  String toJson() => json.encode(toMap());

  TelcoBalance copyWith({
    int? id,
    int? userId,
    int? serviceProvider,
    dynamic telcoPhoneNo,
    String? walletAccount,
    String? telcoWalletAccount,
    String? status,
    double? dataBalance,
    double? airtimeBalance,
    String? createdDate,
    String? updatedDate,
  }) {
    return TelcoBalance(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      telcoPhoneNo: telcoPhoneNo ?? this.telcoPhoneNo,
      walletAccount: walletAccount ?? this.walletAccount,
      telcoWalletAccount: telcoWalletAccount ?? this.telcoWalletAccount,
      status: status ?? this.status,
      dataBalance: dataBalance ?? this.dataBalance,
      airtimeBalance: airtimeBalance ?? this.airtimeBalance,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }
}
