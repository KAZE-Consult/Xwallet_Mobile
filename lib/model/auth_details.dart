import 'dart:convert';

class AuthDetails {
  String? responseCode;
  String? responseDescription;
  String? accessToken;
  dynamic refreshToken;

  AuthDetails({
    this.responseCode,
    this.responseDescription,
    this.accessToken,
    this.refreshToken,
  });

  @override
  String toString() {
    return 'AuthDetails(responseCode: $responseCode, responseDescription: $responseDescription, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  factory AuthDetails.fromMap(Map<String, dynamic> data) => AuthDetails(
        responseCode: data['responseCode'] as String?,
        responseDescription: data['responseDescription'] as String?,
        accessToken: data['accessToken'] as String?,
        refreshToken: data['refreshToken'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'responseCode': responseCode,
        'responseDescription': responseDescription,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthDetails].
  factory AuthDetails.fromJson(String data) {
    return AuthDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  AuthDetails copyWith({
    String? responseCode,
    String? responseDescription,
    String? accessToken,
    dynamic refreshToken,
  }) {
    return AuthDetails(
      responseCode: responseCode ?? this.responseCode,
      responseDescription: responseDescription ?? this.responseDescription,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
