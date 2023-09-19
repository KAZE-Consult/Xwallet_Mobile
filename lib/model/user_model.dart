import 'dart:convert';

class UserModel {
  int? userId;
  String? userName;
  String? walletAccount;
  dynamic bankAccount;
  String? password;
  String? businessName;
  String? businessAddress;
  String? firstName;
  String? lastName;
  String? middleName;
  String? dob;
  String? bvn;
  String? phoneNo;
  String? emailAddress;
  int? idType;
  String? idNumber;
  String? passportPhoto;
  int? serviceProvider;
  String? address;
  String? superSimPhoneNo;
  String? superSimEmailAddress;
  int? roleId;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdDate;
  int? createdBy;
  dynamic approvedDate;
  dynamic approvedBy;
  dynamic modifiedDate;
  dynamic modifiedBy;
  String? otpReference;
  String? otp;
  bool? isPinset;
  String? pin;

  UserModel({
    this.userId,
    this.userName,
    this.walletAccount,
    this.bankAccount,
    this.password,
    this.businessName,
    this.businessAddress,
    this.firstName,
    this.lastName,
    this.middleName,
    this.dob,
    this.bvn,
    this.phoneNo,
    this.emailAddress,
    this.idType,
    this.idNumber,
    this.passportPhoto,
    this.serviceProvider,
    this.address,
    this.superSimPhoneNo,
    this.superSimEmailAddress,
    this.roleId,
    this.isActive,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.approvedDate,
    this.approvedBy,
    this.modifiedDate,
    this.modifiedBy,
    this.otpReference,
    this.otp,
    this.isPinset,
    this.pin,
  });

  @override
  String toString() {
    return 'UserModel(userId: $userId, userName: $userName, walletAccount: $walletAccount, bankAccount: $bankAccount, password: $password, businessName: $businessName, businessAddress: $businessAddress, firstName: $firstName, lastName: $lastName, middleName: $middleName, dob: $dob, bvn: $bvn, phoneNo: $phoneNo, emailAddress: $emailAddress, idType: $idType, idNumber: $idNumber, passportPhoto: $passportPhoto, serviceProvider: $serviceProvider, address: $address, superSimPhoneNo: $superSimPhoneNo, superSimEmailAddress: $superSimEmailAddress, roleId: $roleId, isActive: $isActive, isDeleted: $isDeleted, createdDate: $createdDate, createdBy: $createdBy, approvedDate: $approvedDate, approvedBy: $approvedBy, modifiedDate: $modifiedDate, modifiedBy: $modifiedBy, otpReference: $otpReference, otp: $otp, isPinset: $isPinset, pin: $pin)';
  }

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        userId: data['userId'] as int?,
        userName: data['userName'] as String?,
        walletAccount: data['walletAccount'] as String?,
        bankAccount: data['bankAccount'] as dynamic,
        password: data['password'] as String?,
        businessName: data['businessName'] as String?,
        businessAddress: data['businessAddress'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        middleName: data['middleName'] as String?,
        dob: data['dob'] as String?,
        bvn: data['bvn'] as String?,
        phoneNo: data['phoneNo'] as String?,
        emailAddress: data['emailAddress'] as String?,
        idType: data['idType'] as int?,
        idNumber: data['idNumber'] as String?,
        passportPhoto: data['passportPhoto'] as String?,
        serviceProvider: data['serviceProvider'] as int?,
        address: data['address'] as String?,
        superSimPhoneNo: data['superSimPhoneNo'] as String?,
        superSimEmailAddress: data['superSimEmailAddress'] as dynamic,
        roleId: data['roleId'] as int?,
        isActive: data['isActive'] as bool?,
        isDeleted: data['isDeleted'] as bool?,
        createdDate: data['createdDate'] == null
            ? null
            : DateTime.parse(data['createdDate'] as String),
        createdBy: data['createdBy'] as dynamic,
        approvedDate: data['approvedDate'] as dynamic,
        approvedBy: data['approvedBy'] as dynamic,
        modifiedDate: data['modifiedDate'] as dynamic,
        modifiedBy: data['modifiedBy'] as dynamic,
        otpReference: data['otpReference'] as String?,
        otp: data['otp'] as dynamic,
        isPinset: data['isPinset'] as bool?,
        pin: data['pin'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'userName': userName,
        'walletAccount': walletAccount,
        'bankAccount': bankAccount,
        'password': password,
        'businessName': businessName,
        'businessAddress': businessAddress,
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'dob': dob,
        'bvn': bvn,
        'phoneNo': phoneNo,
        'emailAddress': emailAddress,
        'idType': idType,
        'idNumber': idNumber,
        'passportPhoto': passportPhoto,
        'serviceProvider': serviceProvider,
        'address': address,
        'superSimPhoneNo': superSimPhoneNo,
        'superSimEmailAddress': superSimEmailAddress,
        'roleId': roleId,
        'isActive': isActive,
        'isDeleted': isDeleted,
        'createdDate': createdDate?.toIso8601String(),
        'createdBy': createdBy,
        'approvedDate': approvedDate,
        'approvedBy': approvedBy,
        'modifiedDate': modifiedDate,
        'modifiedBy': modifiedBy,
        'otpReference': otpReference,
        'otp': otp,
        'isPinset': isPinset,
        'pin': pin,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    int? userId,
    String? userName,
    String? walletAccount,
    dynamic bankAccount,
    String? password,
    String? businessName,
    String? businessAddress,
    String? firstName,
    String? lastName,
    String? middleName,
    String? dob,
    String? bvn,
    String? phoneNo,
    String? emailAddress,
    int? idType,
    String? idNumber,
    String? passportPhoto,
    int? serviceProvider,
    String? address,
    String? superSimPhoneNo,
    dynamic superSimEmailAddress,
    int? roleId,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
    dynamic createdBy,
    dynamic approvedDate,
    dynamic approvedBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    String? otpReference,
    dynamic otp,
    bool? isPinset,
    String? pin,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      walletAccount: walletAccount ?? this.walletAccount,
      bankAccount: bankAccount ?? this.bankAccount,
      password: password ?? this.password,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      dob: dob ?? this.dob,
      bvn: bvn ?? this.bvn,
      phoneNo: phoneNo ?? this.phoneNo,
      emailAddress: emailAddress ?? this.emailAddress,
      idType: idType ?? this.idType,
      idNumber: idNumber ?? this.idNumber,
      passportPhoto: passportPhoto ?? this.passportPhoto,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      address: address ?? this.address,
      superSimPhoneNo: superSimPhoneNo ?? this.superSimPhoneNo,
      superSimEmailAddress: superSimEmailAddress ?? this.superSimEmailAddress,
      roleId: roleId ?? this.roleId,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
      createdDate: createdDate ?? this.createdDate,
      createdBy: createdBy ?? this.createdBy,
      approvedDate: approvedDate ?? this.approvedDate,
      approvedBy: approvedBy ?? this.approvedBy,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      otpReference: otpReference ?? this.otpReference,
      otp: otp ?? this.otp,
      isPinset: isPinset ?? this.isPinset,
      pin: pin ?? this.pin,
    );
  }
}
