import 'package:bloc_test/data/api/dio_client/error/network_exception.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource.dart';
import 'package:bloc_test/data/models/student_model.dart';
import 'package:bloc_test/domain/entities/student.dart';
import 'package:bloc_test/domain/repositories/student_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class StudentRepositoryImp extends StudentRepository {
  final StudentRemoteDatasource _studentRemoteDatasource;

  StudentRepositoryImp(this._studentRemoteDatasource);

  @override
  Future<Either<NetworkException, Student>> getStudentById(int id) {
    // TODO: implement getStudentById
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkException, List<Student>>> getStudents() async {
    try {
      List<StudentModel> response =
          await _studentRemoteDatasource.getStudents();

      return right(response.map((student) => student.toEntity()).toList());
    } on DioException catch (e) {
      return left(NetworkException.fromDioError(e));
    }
  }
}
