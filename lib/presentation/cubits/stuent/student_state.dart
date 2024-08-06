import 'package:bloc_test/domain/entities/student.dart';
import 'package:equatable/equatable.dart';

class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;

  const StudentLoaded(this.students);

  @override
  List<Object?> get props => [students];
}

class StudentError extends StudentState {
  final String message;

  const StudentError(this.message);

  @override
  List<Object> get props => [message];
}
