import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/model/student_model.dart';
import 'package:studentapp_sqflite/views/screens/show_student.dart';



class StudentsWidget extends StatelessWidget {
  final StudentModel studentModel;

  const StudentsWidget(this.studentModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    ShowStudentsScreen(studentModel: studentModel))));
      }),
      child: Container(
        decoration: BoxDecoration(
            color: !Provider.of<StudentClass>(context).isDark
                ? Colors.teal[100]
                : null,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: ListTile(
          tileColor: !Provider.of<StudentClass>(context).isDark
              ? Colors.teal[100]
              : null,
          leading: studentModel.image == null
              ? Container(
                  decoration: BoxDecoration(
                      color: !Provider.of<StudentClass>(context).isDark
                          ? Colors.teal
                          : null,
                      borderRadius: BorderRadius.circular(8)),
                  height: double.infinity,
                  width: 70,
                  child: const Center(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/avathar1.jp'),
                  )))
              : Image.file(
                  studentModel.image!,
                  width: 70,
                  height: double.infinity,
                ),
          title: Text(studentModel.name),
          subtitle: Text(studentModel.course),
        ),
      ),
    );
  }
}