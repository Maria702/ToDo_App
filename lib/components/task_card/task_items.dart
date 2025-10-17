import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_app/components/taskModel.dart';
import 'package:todo_app/utils/color_contraint.dart';

class TaskItems extends StatelessWidget {
  final Task task;

  const TaskItems({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          height: 56,
          decoration: BoxDecoration(
            color: ColorContraint.secondrayColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,

                          fontSize: 15,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 47,
                          height: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff254069),
                          ),
                          child: Center(
                            child: Text(
                              "To do ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.more_vert_rounded)],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 5),
                    Text(
                      "${task.fromDate} - ${task.toDate}",

                      style: TextStyle(fontSize: 12),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(Icons.flag)],
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
