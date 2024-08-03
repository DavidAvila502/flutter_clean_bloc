import 'package:bloc_test/domain/entities/student.dart';
import 'package:bloc_test/domain/repositories/student_repository.dart';

class StudentUseCases {
  final StudentRepository studentRepository;

  const StudentUseCases(this.studentRepository);

  Future<List<Student>> getStudents() => studentRepository.getStudents();

  Future<Student> getStudentById(int id) =>
      studentRepository.getStudentById(id);
}
