import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/model/student_model.dart';
import 'package:studentapp_sqflite/views/screens/edit_student.dart';
class ShowStudentsScreen extends StatelessWidget {
  final StudentModel studentModel;

  const ShowStudentsScreen({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentClass>(
        builder: ((context, provider, child) => Scaffold(
              appBar: AppBar(
                actions: [
                  InkWell(
                      onTap: () {
                        provider.nameController.text = studentModel.name;
                        provider.ageController.text =studentModel.age.toString();
                        provider.courseController.text =   studentModel.course;
                         provider.addressController.text = studentModel.address;
                         provider.bloodcontroller.text=studentModel.bloodgroup;
                         provider.phonecontroller.text=studentModel.phonenumber.toString();
                        provider.image = studentModel.image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => EditStudentsScreen(
                                    studentModel: studentModel))));
                      },
                      child: const Icon(Icons.edit)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        provider.deleteStudent(studentModel);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.delete)),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal
                            : null,
                        borderRadius: BorderRadius.circular(5)),
                    height: 170,
                    //width: double.infinity,
                    child: studentModel.image == null
                        ? const Center(
                            child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/image/avathar1.jpg'),
                          ))
                        : Image.file(
                          studentModel.image!,
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      studentModel.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'age :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${studentModel.age} ',
                          style: const TextStyle(fontSize: 16),
                        ),SizedBox(height: 10,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,), 
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'blood group : ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          studentModel.bloodgroup,
                          
                          style: const TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'class/course :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          studentModel.course,
                          style: const TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ), Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'phone number :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                       SizedBox(height:20),
                        Text(
                           '${studentModel.phonenumber} ',
                          style: const TextStyle(fontSize: 26),
                        ),
                      ],
                    ),
                  ),   const SizedBox(
                          height: 20,
                        ),
                       Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                        color: !Provider.of<StudentClass>(context).isDark
                            ? Colors.teal[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'address :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          studentModel.address,
                          style: const TextStyle(fontSize: 26),
                        )
                      ],
                    ),
                  ),
                      
                ]),
              ),
            )));
  }
}