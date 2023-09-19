class RegisterInputModel {
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

  RegisterInputModel({
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

  factory RegisterInputModel.fromJson(Map<String, dynamic> json) {
    return RegisterInputModel(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNo: json['phoneNo'] as String?,
      emailAddress: json['emailAddress'] as String?,
      serviceProvider: json['serviceProvider'] as int?,
      superSimPhoneNo: json['superSimPhoneNo'] as String?,
      createdBy: json['createdBy'] as int?,
      roleId: json['roleId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNo': phoneNo,
        'emailAddress': emailAddress,
        'serviceProvider': serviceProvider,
        'superSimPhoneNo': superSimPhoneNo,
        'createdBy': createdBy,
        'roleId': roleId,
      };
}
