import 'package:flutter/material.dart';
import 'screens/navigation_screens.dart';
import 'screens/quiz_screen.dart';
import 'models/curriculum.dart';

void main() {
  runApp(const MySchoolWorkApp());
}

class MySchoolWorkApp extends StatelessWidget {
  const MySchoolWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySchoolWork',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Comic Sans MS', // fallback or general playful aesthetic implied
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const GradeSelectionScreen());
        }
        if (settings.name == '/quiz') {
          final activity = settings.arguments as Activity;
          return MaterialPageRoute(builder: (context) => QuizScreen(activity: activity));
        }
        return null;
      },
    );
  }
}
