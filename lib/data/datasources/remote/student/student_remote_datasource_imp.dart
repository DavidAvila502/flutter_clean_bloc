import 'package:bloc_test/data/api/dio_client/dio_client.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource.dart';
import 'package:bloc_test/data/models/student_model.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';

class StudentRemoteDatasourceImp extends StudentRemoteDatasource {
  final DioClient _dioClient;

  StudentRemoteDatasourceImp(this._dioClient);

  @override
  Future<StudentModel> getStudentById(int id) async {
    // TODO: implement getStudents
    throw UnimplementedError();
  }

  @override
  Future<List<StudentModel>> getStudents() async {
    try {
      final Response<dynamic> response = await _dioClient.get('/students');

      List<dynamic> listResponse = response.data as List<dynamic>;

      return listResponse
          .map((item) => StudentModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      rethrow;
    }
  }
}
