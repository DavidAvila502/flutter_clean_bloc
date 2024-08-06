import 'package:bloc_test/data/api/dio_client/dio_client.dart';
import 'package:bloc_test/data/datasources/remote/student/student_remote_datasource_imp.dart';
import 'package:bloc_test/data/repositories/student_repository_imp.dart';
import 'package:bloc_test/domain/use_cases/student_use_cases.dart';
import 'package:bloc_test/presentation/cubits/stuent/student_cubit.dart';
import 'package:bloc_test/presentation/cubits/stuent/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StudentUseCases _studentUsecases = StudentUseCases(
      StudentRepositoryImp(StudentRemoteDatasourceImp(DioClient())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: BlocProvider(
        create: (context) => StudentCubit(_studentUsecases)..fetchStudents(),
        child: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Student List'),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<StudentCubit, StudentState>(
                    builder: (context, state) {
                      if (state is StudentLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is StudentLoaded) {
                        return SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: state.students.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                  child: Text(state.students[index].name));
                            },
                          ),
                        );
                      }

                      return const Center(
                        child: Text('Error inesperado'),
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
