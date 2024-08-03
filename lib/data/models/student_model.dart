import 'package:bloc_test/domain/entities/student.dart';

class StudentModel extends Student {
  const StudentModel(
      {required super.id,
      required super.name,
      required super.age,
      required super.gender,
      required super.email});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        gender: json['gender'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'email': email
    };
  }
}
