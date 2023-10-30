import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/database/dbHelper.dart';
import 'package:studentapp_sqflite/views/screens/main_student_screen.dart';
import 'package:studentapp_sqflite/views/screens/new_student_screen.dart';
import 'package:studentapp_sqflite/views/screens/splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<StudentClass>(
          create: (context) => StudentClass(),),
          ],
        child: const InitApp());
    
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<StudentClass>(context).isDark
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: Colors.teal[200],
              dialogBackgroundColor: Colors.teal[200],
              primaryColor: Colors.teal[200]),
      title: 'student app',
      home: const SplashScreen(),
      routes: {
        '/new_student_screen': (context) => const NewStudentsScreen(),
        '/main_student_screen': (context) => const MainStudentsScreen(),
      },
    );
  }
}