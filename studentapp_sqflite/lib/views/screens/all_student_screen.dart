
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/views/widget/studentwidget.dart';

class AllStudentsScreen extends StatelessWidget {
  const AllStudentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentClass>(
      builder: (BuildContext context, provider, Widget? child) {
        return ListView.builder(
            itemCount: provider.allStudent.length,
            itemBuilder: (context, index) {
              return StudentsWidget(provider.allStudent[index]);
            });
      },
    );
  }
}