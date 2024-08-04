import 'package:bloc_test/data/api/dio_client/dio_client.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource_imp.dart';
import 'package:bloc_test/data/repositories/student_repository_imp.dart';
import 'package:bloc_test/domain/entities/student.dart';
import 'package:bloc_test/domain/use_cases/student_use_cases.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StudentUseCases _studentUsecases = StudentUseCases(
      StudentRepositoryImp(StudentRemoteDatasourceImp(DioClient())));

  List<Student> studentList = [];

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    var response = await _studentUsecases.getStudents();

    response.fold((onLeft) {}, (onRight) {
      setState(() {
        studentList = onRight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Student List'),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 600,
                  // width: 400,
                  child: ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(studentList[index].name),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
