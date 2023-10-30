import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/model/student_model.dart';


class EditStudentsScreen extends StatefulWidget {
  final StudentModel studentModel;
  const EditStudentsScreen({super.key, required this.studentModel});

  @override
  State<EditStudentsScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditStudentsScreen> {
  Future pickImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    // ignore: use_build_context_synchronously
    Provider.of<StudentClass>(context, listen: false).image = File(image.path);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit students'),
        ),
        body: Consumer<StudentClass>(
          builder: (context, provider, child) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                    children: [
                      PopupMenuButton(
                        color: !provider.isDark ? Colors.teal[100] : null,
                        itemBuilder: ((context) => [
                              PopupMenuItem(
                                onTap: (() =>
                                    pickImage(context, ImageSource.camera)),
                                child: const Row(
                                  children: [
                                    Icon(Icons.camera_alt_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Take a picture'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: (() =>
                                    pickImage(context, ImageSource.gallery)),
                                child: const Row(
                                  children: [
                                    Icon(Icons.image_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Select a picture'),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const Text(
                        'ADD A PICTURE',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Visibility(
                      visible: provider.image != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          provider.image != null
                              ? Image.file(
                                  provider.image!,
                                  width: 100,
                                  height: 100,
                                )
                              : Container(),
                        ],
                      )),
                  const SizedBox(height: 20),
                  TextField(
                    controller: provider.nameController,
                    decoration: InputDecoration(
                        label: const Text('student Name'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: provider.ageController,
                    decoration: InputDecoration(
                        label: const Text('Age'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                    TextField(
                    controller: provider.bloodcontroller,
                    decoration: InputDecoration(
                        label: const Text('blood group'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                
                  const SizedBox(
                    height: 20,
                  ),
                 TextField(
                        controller: provider.courseController,
                        decoration: InputDecoration(
                            label: const Text('course/class'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                    TextField(
                    controller: provider.phonecontroller,
                    decoration: InputDecoration(
                        label: const Text('phone number'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),const SizedBox(
                    height: 20,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: 100,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        controller: provider.addressController,
                        decoration: InputDecoration(
                            label: const Text('address'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                 
                
                  ElevatedButton(
                    onPressed: () {
                      widget.studentModel.name = provider.nameController.text;
                      widget.studentModel.age = int.parse(
                          provider.ageController.text != ''
                              ? provider.ageController.text
                              : '0');
                       widget.studentModel.phonenumber = int.parse(
                          provider.phonecontroller.text != ''
                              ? provider.phonecontroller.text
                              : '0');
                      widget.studentModel.image = provider.image;
                      widget.studentModel.course =
                          provider.courseController.text;
                      widget.studentModel.bloodgroup =
                          provider.bloodcontroller.text;
                      widget.studentModel.address =
                          provider.addressController.text;
                      provider.updateStudent(widget.studentModel);
                      provider.nameController.clear();
                      provider.ageController.clear();
                      provider.addressController.clear();
                      provider.courseController.clear();
                      provider.phonecontroller.clear();
                      provider.bloodcontroller.clear();
                      provider.image = null;
                      Navigator.of(context).pop();
                    },
                    child: const Center(child: Text('Save Changes')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}