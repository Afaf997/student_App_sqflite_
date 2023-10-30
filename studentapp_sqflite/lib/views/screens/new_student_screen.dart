import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';


class NewStudentsScreen extends StatefulWidget {
  const NewStudentsScreen({super.key});

  @override
  State<NewStudentsScreen> createState() => _NewStudentsScreenState();
}

class _NewStudentsScreenState extends State<NewStudentsScreen> {
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
          title: const Text('Add New Students'),
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
                          InkWell(
                            onTap: () {
                              provider.image = null;
                         
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                          ),
                          provider.image != null
                              ? Image.file(
                                  provider.image!,
                                  width: 100,
                                  height: 100,
                                )
                              : Container(),
                        ],
                      )),
                  const SizedBox(height: 10),
                  TextField(
                    controller: provider.nameController,
                    decoration: InputDecoration(
                        label: const Text('Student Name'),
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
                        label: const Text('age'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                 
                  const SizedBox(
                    height: 20,
                  ),
                     TextField(
                    controller: provider.bloodcontroller,
                    decoration: InputDecoration(
                        label: const Text('blood'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                TextField(
                        controller: provider.courseController,
                        decoration: InputDecoration(
                            label: const Text('course'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                   const SizedBox(
                    height: 20,
                  ),
                     TextField(
                      keyboardType: TextInputType.number,
                    controller: provider.phonecontroller,
                    decoration: InputDecoration(
                        label: const Text('phone number'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.insertNewStudent();
                      provider.nameController.clear();
                      provider.ageController.clear();
                      provider.addressController.clear();
                      provider.courseController.clear();
                        provider.phonecontroller.clear();
                      provider.bloodcontroller.clear();
                      provider.image = null;
                      Navigator.of(context).pop();
                    },
                    child: const Center(child: Text('Save student')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}