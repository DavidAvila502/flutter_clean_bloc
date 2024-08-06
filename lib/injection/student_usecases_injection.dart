import 'package:bloc_test/data/api/dio_client/dio_client.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource_imp.dart';
import 'package:bloc_test/data/repositories/student_repository_imp.dart';
import 'package:bloc_test/domain/repositories/student_repository.dart';
import 'package:bloc_test/domain/use_cases/student_use_cases.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupStudentUsecasesInjection() {
  // register api client
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Register datasources
  getIt.registerLazySingleton<StudentRemoteDatasource>(
      () => StudentRemoteDatasourceImp(getIt()));

// Register repository
  getIt.registerLazySingleton<StudentRepository>(
      () => StudentRepositoryImp(getIt()));

  // Register usecases
  getIt.registerLazySingleton<StudentUseCases>(() => StudentUseCases(getIt()));
}
