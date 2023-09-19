import 'dart:convert';

class SendToXWalletInputModel {
  String? requestId;
  String? fromAcctNo;
  String? toAcctNo;
  String? referenceId;
  int? amount;
  String? naration;
  String? pin;
  String? transferType;

  SendToXWalletInputModel({
    this.requestId,
    this.fromAcctNo,
    this.toAcctNo,
    this.referenceId,
    this.amount,
    this.naration,
    this.pin,
  });

  @override
  String toString() {
    return 'SendToXWalletInputModel(requestId: $requestId, fromAcctNo: $fromAcctNo, toAcctNo: $toAcctNo, referenceId: $referenceId, amount: $amount, naration: $naration, pin: $pin)';
  }

  factory SendToXWalletInputModel.fromMap(Map<String, dynamic> data) {
    return SendToXWalletInputModel(
      requestId: data['requestId'] as String?,
      fromAcctNo: data['fromAcctNo'] as String?,
      toAcctNo: data['toAcctNo'] as String?,
      referenceId: data['referenceId'] as String?,
      amount: data['amount'] as int?,
      naration: data['naration'] as String?,
      pin: data['pin'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'requestId': requestId,
        'fromAcctNo': fromAcctNo,
        'toAcctNo': toAcctNo,
        'referenceId': referenceId,
        'amount': amount,
        'naration': naration,
        'pin': pin,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SendToXWalletInputModel].
  factory SendToXWalletInputModel.fromJson(String data) {
    return SendToXWalletInputModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SendToXWalletInputModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SendToXWalletInputModel copyWith({
    String? requestId,
    String? fromAcctNo,
    String? toAcctNo,
    String? referenceId,
    int? amount,
    String? naration,
    String? pin,
  }) {
    return SendToXWalletInputModel(
      requestId: requestId ?? this.requestId,
      fromAcctNo: fromAcctNo ?? this.fromAcctNo,
      toAcctNo: toAcctNo ?? this.toAcctNo,
      referenceId: referenceId ?? this.referenceId,
      amount: amount ?? this.amount,
      naration: naration ?? this.naration,
      pin: pin ?? this.pin,
    );
  }
}
