import 'package:bloc_test/injection/student_usecases_injection.dart';
import 'package:bloc_test/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupStudentUsecasesInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
