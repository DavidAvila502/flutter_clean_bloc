import 'package:bloc_test/data/api/dio_client/error/network_exception.dart';
import 'package:bloc_test/domain/entities/student.dart';
import 'package:fpdart/fpdart.dart';

abstract class StudentRepository {
  // Remote data source
  Future<Either<NetworkException, List<Student>>> getStudents();
  Future<Either<NetworkException, Student>> getStudentById(int id);

  // Local Datasource
}
