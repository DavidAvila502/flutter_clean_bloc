import 'package:bloc_test/data/models/student_model.dart';

abstract class StudentRemoteDatasource {
  Future<List<StudentModel>> getStudents();
  Future<StudentModel> getStudentById(int id);
}
