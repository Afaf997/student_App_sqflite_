// ignore_for_file: file_names
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studentapp_sqflite/model/student_model.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'students';
  final String nameColumn = 'name';
  final String idColumn = 'id';
  final String courseColumn = 'course';
  final String addressColumn = 'address';
  final String ageColumn = 'age';
  final String phonenumbercolumn= 'phonenumber';
  final String bloodgroupcolumn='bloodgroup';
  final String imageColumn = 'image';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/students.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $ageColumn INTEGER, $courseColumn TEXT, $addressColumn TEXT, $phonenumbercolumn  INTEGER, $bloodgroupcolumn TEXT, $imageColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<StudentModel>> getAllStudents() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) =>StudentModel.fromMap(e)).toList();
  }

  insertNewStudents(StudentModel studentModel) {
    database.insert(tableName, studentModel.toMap());
  }

  deleteStudents(StudentModel studentModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [studentModel.id]);
  }

  deleteStudent() {
    database.delete(tableName);
  }

  updateStudent(StudentModel studentModel) async {
    await database.update(
        tableName,
        {
          nameColumn: studentModel.name,
          ageColumn: studentModel.age,
          imageColumn: studentModel.image!.path,
          courseColumn: studentModel.course,
          addressColumn: studentModel.address,
          phonenumbercolumn: studentModel.phonenumber,
          bloodgroupcolumn:studentModel.bloodgroup,
        },
        where: '$idColumn=?',
        whereArgs: [studentModel.id]);
  }
}