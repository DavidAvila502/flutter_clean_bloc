import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String email;

  const Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.email});

  @override
  List<Object?> get props => [id, name, age, gender, email];
}
