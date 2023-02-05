import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Roles {
  int roleId;
  String roleName;
  Roles({
    required this.roleId,
    required this.roleName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roleId': roleId,
      'roleName': roleName,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      roleId: map['roleId'] as int,
      roleName: map['roleName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) =>
      Roles.fromMap(json.decode(source) as Map<String, dynamic>);
}
