import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/components/CircleAvatar/circleAvator.dart';
import 'package:todo_app/components/task_card/taskCard.dart';
import 'package:todo_app/components/task_card/task_items.dart';
import 'package:todo_app/components/task_status/taskStatus.dart';
import 'package:todo_app/utils/color_contraint.dart';
import 'package:todo_app/utils/font_contraint.dart';
import 'package:todo_app/components/taskModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  // This function will be called from TaskStatus to add a new task
  void addNewTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorContraint.primaryThemeColor,

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatorScreen(
                            titleText: "Welcome to Notes",

                            avatarImage: "assets/images/avatar.jpg",
                          ),
                        ],
                      ),

                      Text(
                        "Have a great Day",
                        style: TextStyle(fontSize: FontContraint.title),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "My Priority Task ",

                    style: TextStyle(fontSize: FontContraint.title),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Padding(
                padding: EdgeInsetsGeometry.all(12),
                child: Row(
                  children: [
                    TaskCard(
                      iconData: Icons.phone_android_outlined,
                      taskDate: "2 hours Ago",
                      titleTask: "Mobile App UI Design",
                      titleDescrip: "using Figma and other tools",
                    ),
                    SizedBox(width: 25),
                    TaskCard(
                      iconData: Icons.camera_alt_outlined,
                      taskDate: "4 hours Ago",
                      titleTask: "Capture sun Rise Shots",
                      titleDescrip: "complete GuruShot Challenge",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Tasks ",
                    style: TextStyle(
                      fontSize: FontContraint.subtitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () async {
                      final newTask = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskStatus()),
                      );
                      if (newTask != null) {
                        addNewTask(newTask);
                      }
                    },
                    icon: Icon(
                      Icons.add_circle,
                      size: 38.0,
                      color: ColorContraint.addTaskButton,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today’s Task",
                    style: TextStyle(
                      fontSize: FontContraint.caption,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Weekly  Task",
                    style: TextStyle(
                      fontSize: FontContraint.caption,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Monthly Task",
                    style: TextStyle(
                      fontSize: FontContraint.caption,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Column(
                children: tasks.map((task) => TaskItems(task: task)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
