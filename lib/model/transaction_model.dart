import 'dart:convert';

class TransactionModel {
  int? transId;
  dynamic requestid;
  String? fromAcctNo;
  String? toAcctNo;
  String? walletAccount;
  dynamic mirrowAccount;
  dynamic customerId;
  String? referenceId;
  DateTime? transactionDate;
  String? tranType;
  double? amount;
  int? roleId;
  String? status;
  dynamic responseCode;
  dynamic responseMessage;
  String? naration;
  dynamic balanceBeforeTransaction;
  dynamic balanceAfterTransaction;
  dynamic transactionType;
  dynamic paymentDate;
  dynamic paymentResponseCode;
  dynamic paymentResponseDescription;
  dynamic createdDate;
  int? userId;
  dynamic approvedDate;
  dynamic approvedBy;
  dynamic modifiedDate;
  dynamic modifiedBy;

  TransactionModel({
    this.transId,
    this.requestid,
    this.fromAcctNo,
    this.toAcctNo,
    this.walletAccount,
    this.mirrowAccount,
    this.customerId,
    this.referenceId,
    this.transactionDate,
    this.tranType,
    this.amount,
    this.roleId,
    this.status,
    this.responseCode,
    this.responseMessage,
    this.naration,
    this.balanceBeforeTransaction,
    this.balanceAfterTransaction,
    this.transactionType,
    this.paymentDate,
    this.paymentResponseCode,
    this.paymentResponseDescription,
    this.createdDate,
    this.userId,
    this.approvedDate,
    this.approvedBy,
    this.modifiedDate,
    this.modifiedBy,
  });

  @override
  String toString() {
    return 'TransactionModel(transId: $transId, requestid: $requestid, fromAcctNo: $fromAcctNo, toAcctNo: $toAcctNo, walletAccount: $walletAccount, mirrowAccount: $mirrowAccount, customerId: $customerId, referenceId: $referenceId, transactionDate: $transactionDate, tranType: $tranType, amount: $amount, roleId: $roleId, status: $status, responseCode: $responseCode, responseMessage: $responseMessage, naration: $naration, balanceBeforeTransaction: $balanceBeforeTransaction, balanceAfterTransaction: $balanceAfterTransaction, transactionType: $transactionType, paymentDate: $paymentDate, paymentResponseCode: $paymentResponseCode, paymentResponseDescription: $paymentResponseDescription, createdDate: $createdDate, userId: $userId, approvedDate: $approvedDate, approvedBy: $approvedBy, modifiedDate: $modifiedDate, modifiedBy: $modifiedBy)';
  }

  factory TransactionModel.fromMap(Map<String, dynamic> data) {
    return TransactionModel(
      transId: data['transId'] as int?,
      requestid: data['requestid'] as dynamic,
      fromAcctNo: data['fromAcctNo'] as String?,
      toAcctNo: data['toAcctNo'] as String?,
      walletAccount: data['walletAccount'] as String?,
      mirrowAccount: data['mirrowAccount'] as dynamic,
      customerId: data['customerId'] as dynamic,
      referenceId: data['referenceId'] as String?,
      transactionDate: data['transactionDate'] == null
          ? null
          : DateTime.parse(data['transactionDate'] as String),
      tranType: data['tranType'] as String?,
      amount: data['amount'] as double?,
      roleId: data['roleId'] as int?,
      status: data['status'] as String?,
      responseCode: data['responseCode'] as dynamic,
      responseMessage: data['responseMessage'] as dynamic,
      naration: data['naration'] as String?,
      balanceBeforeTransaction: data['balanceBeforeTransaction'] as dynamic,
      balanceAfterTransaction: data['balanceAfterTransaction'] as dynamic,
      transactionType: data['transactionType'] as dynamic,
      paymentDate: data['paymentDate'] as dynamic,
      paymentResponseCode: data['paymentResponseCode'] as dynamic,
      paymentResponseDescription: data['paymentResponseDescription'] as dynamic,
      createdDate: data['createdDate'] as dynamic,
      userId: data['userId'] as int?,
      approvedDate: data['approvedDate'] as dynamic,
      approvedBy: data['approvedBy'] as dynamic,
      modifiedDate: data['modifiedDate'] as dynamic,
      modifiedBy: data['modifiedBy'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'transId': transId,
        'requestid': requestid,
        'fromAcctNo': fromAcctNo,
        'toAcctNo': toAcctNo,
        'walletAccount': walletAccount,
        'mirrowAccount': mirrowAccount,
        'customerId': customerId,
        'referenceId': referenceId,
        'transactionDate': transactionDate?.toIso8601String(),
        'tranType': tranType,
        'amount': amount,
        'roleId': roleId,
        'status': status,
        'responseCode': responseCode,
        'responseMessage': responseMessage,
        'naration': naration,
        'balanceBeforeTransaction': balanceBeforeTransaction,
        'balanceAfterTransaction': balanceAfterTransaction,
        'transactionType': transactionType,
        'paymentDate': paymentDate,
        'paymentResponseCode': paymentResponseCode,
        'paymentResponseDescription': paymentResponseDescription,
        'createdDate': createdDate,
        'userId': userId,
        'approvedDate': approvedDate,
        'approvedBy': approvedBy,
        'modifiedDate': modifiedDate,
        'modifiedBy': modifiedBy,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TransactionModel].
  factory TransactionModel.fromJson(String data) {
    return TransactionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TransactionModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TransactionModel copyWith({
    int? transId,
    dynamic requestid,
    String? fromAcctNo,
    String? toAcctNo,
    String? walletAccount,
    dynamic mirrowAccount,
    dynamic customerId,
    String? referenceId,
    DateTime? transactionDate,
    String? tranType,
    double? amount,
    int? roleId,
    String? status,
    dynamic responseCode,
    dynamic responseMessage,
    String? naration,
    dynamic balanceBeforeTransaction,
    dynamic balanceAfterTransaction,
    dynamic transactionType,
    dynamic paymentDate,
    dynamic paymentResponseCode,
    dynamic paymentResponseDescription,
    dynamic createdDate,
    int? userId,
    dynamic approvedDate,
    dynamic approvedBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
  }) {
    return TransactionModel(
      transId: transId ?? this.transId,
      requestid: requestid ?? this.requestid,
      fromAcctNo: fromAcctNo ?? this.fromAcctNo,
      toAcctNo: toAcctNo ?? this.toAcctNo,
      walletAccount: walletAccount ?? this.walletAccount,
      mirrowAccount: mirrowAccount ?? this.mirrowAccount,
      customerId: customerId ?? this.customerId,
      referenceId: referenceId ?? this.referenceId,
      transactionDate: transactionDate ?? this.transactionDate,
      tranType: tranType ?? this.tranType,
      amount: amount ?? this.amount,
      roleId: roleId ?? this.roleId,
      status: status ?? this.status,
      responseCode: responseCode ?? this.responseCode,
      responseMessage: responseMessage ?? this.responseMessage,
      naration: naration ?? this.naration,
      balanceBeforeTransaction:
          balanceBeforeTransaction ?? this.balanceBeforeTransaction,
      balanceAfterTransaction:
          balanceAfterTransaction ?? this.balanceAfterTransaction,
      transactionType: transactionType ?? this.transactionType,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentResponseCode: paymentResponseCode ?? this.paymentResponseCode,
      paymentResponseDescription:
          paymentResponseDescription ?? this.paymentResponseDescription,
      createdDate: createdDate ?? this.createdDate,
      userId: userId ?? this.userId,
      approvedDate: approvedDate ?? this.approvedDate,
      approvedBy: approvedBy ?? this.approvedBy,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedBy: modifiedBy ?? this.modifiedBy,
    );
  }
}
