import 'package:bloc_test/domain/entities/student.dart';

abstract class StudentRemoteDatasource {
  Future<List<Student>> getStudents();
  Future<Student> getStudentById(int id);
}
