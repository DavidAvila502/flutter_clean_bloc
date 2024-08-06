import 'package:bloc_test/domain/use_cases/student_use_cases.dart';
import 'package:bloc_test/presentation/cubits/stuent/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this._studentUsecases) : super(StudentInitial());

  final StudentUseCases _studentUsecases;

  Future<void> fetchStudents() async {
    try {
      emit(StudentLoading());

      final response = await _studentUsecases.getStudents();
      response.fold((error) => emit(StudentError(error.message)),
          (students) => emit(StudentLoaded(students)));
    } catch (_) {
      rethrow;
    }
  }
}
