import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_sqflite/controller/studentprovider.dart';
import 'package:studentapp_sqflite/views/widget/studentwidget.dart';

class MainStudentsScreen extends StatelessWidget {
  const MainStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentClass>(
        builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
              appBar: AppBar(
                title: const Text('students'),
                actions: [
                 
                  PopupMenuButton(
                    color: !myProvider.isDark ? Colors.teal[200] : null,
                    itemBuilder: ((context) => [
                          PopupMenuItem(
                            onTap: (() => Scaffold.of(context).openDrawer()),
                            child: const Text('Open menu'),
                          ),
                          const PopupMenuItem(
                            child: Text('About'),
                          ),
                          PopupMenuItem(
                            onTap: (() => exit(0)),
                            child: const Column(
                              children: [
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.exit_to_app_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Exit'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (() async {
                  await Navigator.pushNamed(context, '/new_student_screen');
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(
                      context, '/main_student_screen');
                }),
                child: const Icon(Icons.add),
              ),
              drawer: Drawer(
                backgroundColor: !myProvider.isDark ? Colors.teal[200] : null,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: !myProvider.isDark ? Colors.teal : null,
                      child: const Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/image/avathar.jpg'),
                          radius: 50,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Home'),
                      leading: const Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/main_student_screen');
                      },
                    ),
               
                    const Divider(
                      thickness: 1,
                    ),
                  
                  
                    Provider.of<StudentClass>(context).isDark
                        ? ListTile(
                            title: const Text('Light Mode'),
                            leading: const Icon(
                              Icons.light_mode_outlined,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Provider.of<StudentClass>(context, listen: false)
                                  .changeIsDark();
                              Navigator.pop(context);
                            },
                          )
                        : ListTile(
                            title: const Text('Dark Mode'),
                            leading: const Icon(
                              Icons.dark_mode_outlined,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Provider.of<StudentClass>(context, listen: false)
                                  .changeIsDark();
                              Navigator.pop(context);
                            },
                          ),
                  ],
                ),
              ),
              body: ListView.builder(
                  itemCount: myProvider.allStudent.length,
                  itemBuilder: (context, index) {
                    return StudentsWidget(myProvider.allStudent[index]);
                  }),
            ));
  }
}