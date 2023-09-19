import 'dart:convert';

class OnboardInputModel {
  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNo;
  String? emailAddress;
  int? serviceProvider;
  String? superSimPhoneNo;
  int? createdBy;
  int? roleId;

  OnboardInputModel({
    this.userName,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.emailAddress,
    this.serviceProvider,
    this.superSimPhoneNo,
    this.createdBy,
    this.roleId,
  });

  @override
  String toString() {
    return 'OnboardInputModel(userName: $userName, password: $password, firstName: $firstName, lastName: $lastName, phoneNo: $phoneNo, emailAddress: $emailAddress, serviceProvider: $serviceProvider, superSimPhoneNo: $superSimPhoneNo, createdBy: $createdBy, roleId: $roleId)';
  }

  factory OnboardInputModel.fromMap(Map<String, dynamic> data) {
    return OnboardInputModel(
      userName: data['userName'] as String?,
      password: data['password'] as String?,
      firstName: data['firstName'] as String?,
      lastName: data['lastName'] as String?,
      phoneNo: data['phoneNo'] as String?,
      emailAddress: data['emailAddress'] as String?,
      serviceProvider: data['serviceProvider'] as int?,
      superSimPhoneNo: data['superSimPhoneNo'] as String?,
      createdBy: data['createdBy'] as int?,
      roleId: data['roleId'] as int?,
    );
  }

  clear() {
    userName = null;
    password = null;
    lastName = null;
    firstName = null;
    phoneNo = null;
    emailAddress = null;
    serviceProvider = null;
    superSimPhoneNo = null;
    roleId = null;
  }

  Map<String, dynamic> toMap() => {
        'userName': userName,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNo': phoneNo ?? '',
        'emailAddress': emailAddress,
        'serviceProvider': serviceProvider,
        'superSimPhoneNo': superSimPhoneNo,
        'createdBy': createdBy ?? 0,
        'roleId': roleId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OnboardInputModel].
  factory OnboardInputModel.fromJson(String data) {
    return OnboardInputModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OnboardInputModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OnboardInputModel copyWith({
    String? userName,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? emailAddress,
    int? serviceProvider,
    String? superSimPhoneNo,
    int? createdBy,
    int? roleId,
  }) {
    return OnboardInputModel(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNo: phoneNo ?? this.phoneNo,
      emailAddress: emailAddress ?? this.emailAddress,
      serviceProvider: serviceProvider ?? this.serviceProvider,
      superSimPhoneNo: superSimPhoneNo ?? this.superSimPhoneNo,
      createdBy: createdBy ?? this.createdBy,
      roleId: roleId ?? this.roleId,
    );
  }
}
