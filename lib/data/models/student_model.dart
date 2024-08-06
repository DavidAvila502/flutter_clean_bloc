import 'package:bloc_test/data/datasources/mappers/entity_convertable.dart';
import 'package:bloc_test/domain/entities/student.dart';
import 'package:equatable/equatable.dart';

class StudentModel extends Equatable
    with EntityConvertible<StudentModel, Student> {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String email;

  const StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.email});

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

  @override
  List<Object?> get props => [id, name, age, gender, email];

  @override
  Student toEntity() {
    return Student(id: id, name: name, age: age, gender: gender, email: email);
  }
}
