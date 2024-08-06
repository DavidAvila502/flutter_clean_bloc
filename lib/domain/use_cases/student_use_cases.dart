import 'package:bloc_test/data/api/dio_client/error/network_exception.dart';
import 'package:bloc_test/domain/entities/student.dart';
import 'package:bloc_test/domain/repositories/student_repository.dart';
import 'package:fpdart/fpdart.dart';

class StudentUseCases {
  final StudentRepository studentRepository;

  const StudentUseCases(this.studentRepository);

  Future<Either<NetworkException, List<Student>>> getStudents() =>
      studentRepository.getStudents();

  Future<Either<NetworkException, Student>> getStudentById(int id) =>
      studentRepository.getStudentById(id);
}
