import 'dart:convert';

class BankModel {
  int? id;
  String? bankCode;
  String? bankShortName;
  String? bankName;
  String? status;
  String? createdDate;

  BankModel({
    this.id,
    this.bankCode,
    this.bankShortName,
    this.bankName,
    this.status,
    this.createdDate,
  });

  @override
  String toString() {
    return 'BankModel(id: $id, bankCode: $bankCode, bankShortName: $bankShortName, bankName: $bankName, status: $status, createdDate: $createdDate)';
  }

  factory BankModel.fromMap(Map<String, dynamic> data) => BankModel(
        id: data['id'] as int?,
        bankCode: data['bankCode'] as String?,
        bankShortName: data['bankShortName'] as String?,
        bankName: data['bankName'] as String?,
        status: data['status'] as String?,
        createdDate: data['createdDate'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'bankCode': bankCode,
        'bankShortName': bankShortName,
        'bankName': bankName,
        'status': status,
        'createdDate': createdDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BankModel].
  factory BankModel.fromJson(String data) {
    return BankModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BankModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BankModel copyWith({
    int? id,
    String? bankCode,
    String? bankShortName,
    String? bankName,
    String? status,
    String? createdDate,
  }) {
    return BankModel(
      id: id ?? this.id,
      bankCode: bankCode ?? this.bankCode,
      bankShortName: bankShortName ?? this.bankShortName,
      bankName: bankName ?? this.bankName,
      status: status ?? this.status,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}
