import 'package:bloc_test/domain/entities/student.dart';

abstract class StudentRepository {
  // Remote data source
  Future<List<Student>> getStudents();
  Future<Student> getStudentById(int id);

  // Local Datasource
}
