import 'dart:convert';
import 'package:collection/collection.dart';

class Session {
  String? responseCode;
  String? responseDescription;
  String? sessionId;
  int? roleId;

  Session({
    this.responseCode,
    this.responseDescription,
    this.sessionId,
    this.roleId,
  });

  @override
  String toString() {
    return 'Session(responseCode: $responseCode, responseDescription: $responseDescription, sessionId: $sessionId, roleId: $roleId)';
  }

  factory Session.fromMap(Map<String, dynamic> data) => Session(
        responseCode: data['responseCode'] as String?,
        responseDescription: data['responseDescription'] as String?,
        sessionId: data['sessionId'] as String?,
        roleId: data['roleId'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'responseCode': responseCode,
        'responseDescription': responseDescription,
        'sessionId': sessionId,
        'roleId': roleId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Session].
  factory Session.fromJson(String data) {
    return Session.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Session] to a JSON string.
  String toJson() => json.encode(toMap());

  Session copyWith({
    String? responseCode,
    String? responseDescription,
    String? sessionId,
    int? roleId,
  }) {
    return Session(
      responseCode: responseCode ?? this.responseCode,
      responseDescription: responseDescription ?? this.responseDescription,
      sessionId: sessionId ?? this.sessionId,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Session) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      responseCode.hashCode ^
      responseDescription.hashCode ^
      sessionId.hashCode ^
      roleId.hashCode;
}
