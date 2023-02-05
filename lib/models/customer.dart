import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Customer {
  int customerId;
  DateTime birthday;
  String gender;
  String name;
  String status;
  Customer({
    required this.customerId,
    required this.birthday,
    required this.gender,
    required this.name,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'birthday': birthday.millisecondsSinceEpoch,
      'gender': gender,
      'name': name,
      'status': status,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      customerId: map['customerId'] as int,
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday'] as int),
      gender: map['gender'] as String,
      name: map['name'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
