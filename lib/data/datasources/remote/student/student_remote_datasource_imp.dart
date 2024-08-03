import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource.dart';
import 'package:bloc_test/domain/entities/student.dart';

class StudentRemoteDatasourceImp extends StudentRemoteDatasource {
  @override
  Future<Student> getStudentById(int id) {
    // TODO: implement getStudentById
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getStudents() {
    // TODO: implement getStudents
    throw UnimplementedError();
  }
}
