import 'package:flutter/material.dart';
import 'package:todo_app/components/CircleAvatar/circleAvator.dart';

import 'package:todo_app/utils/color_contraint.dart';
import 'package:todo_app/utils/font_contraint.dart';
import 'package:todo_app/components/taskModel.dart';

class TaskStatus extends StatefulWidget {
  const TaskStatus({
    super.key,

    // required this.assets,
  });

  @override
  State<TaskStatus> createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  // final String assets;
  Priority? selectedPriority;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  void setPriority(Priority priority) {
    setState(() {
      selectedPriority = priority;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorContraint.primaryThemeColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatorScreen(
                  titleText: "Create new Task",

                  avatarImage: "assets/images/avatar.jpg",
                ),
              ],
            ),

            SizedBox(height: 30),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                        fontWeight: FontContraint.primaryThemeFontWeight,

                        fontSize: FontContraint.title,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 160),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                        fontWeight: FontContraint.primaryThemeFontWeight,
                        fontSize: FontContraint.title,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Row(
                  children: [
                    TaskDate(
                      inputHeight: 40,
                      inputWidth: 128,
                      controller: fromController,
                    ),

                    SizedBox(width: 90),
                    TaskDate(
                      inputHeight: 40,
                      inputWidth: 128,
                      controller: toController,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [TaskTitle(taskTitle: "Title")]),
                Column(
                  children: [
                    TaskInput(
                      inputHeight: 52,
                      inputWidth: 390,
                      controller: titleController,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [TaskTitle(taskTitle: "Desciption")]),
                Column(
                  children: [
                    TaskInput(
                      inputHeight: 101,
                      inputWidth: 390,
                      controller: descriptionController,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: TaskTitle(taskTitle: "Choose Priority"),
            ),
            SizedBox(height: 25),

            Row(
              children: [
                TaskButton(
                  buttonText: "High",
                  bgColor: ColorContraint.highPriority,
                  size: Size(101, 31),
                  isSelected: selectedPriority == Priority.high,
                  onTap: () => setPriority(Priority.high),
                ),
                SizedBox(width: 20),
                TaskButton(
                  buttonText: "Medium",
                  bgColor: ColorContraint.mediumPriority,

                  size: Size(101, 31),
                  isSelected: selectedPriority == Priority.medium,
                  onTap: () => setPriority(Priority.medium),
                ),
                SizedBox(width: 20),
                TaskButton(
                  buttonText: "Low",
                  bgColor: ColorContraint.lowPriority,

                  size: Size(101, 31),
                  isSelected: selectedPriority == Priority.low,
                  onTap: () => setPriority(Priority.low),
                ),
              ],
            ),
            SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomCenter,
              child: TaskButton(
                bgColor: ColorContraint.addTaskButton,
                onTap: () {
                  print(Task);
                  final newTask = Task(
                    title: titleController.text,
                    priority: selectedPriority ?? Priority.low,
                    fromDate: fromController.text,
                    toDate: toController.text,
                  );

                  Navigator.pop(context, newTask);
                },

                isSelected: false,
                buttonText: "Add",
                size: Size(357, 53),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.taskTitle});
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          taskTitle,
          style: TextStyle(
            fontWeight: FontContraint.primaryThemeFontWeight,
            fontSize: FontContraint.subtitle,
          ),
        ),
      ],
    );
  }
}

class TaskInput extends StatefulWidget {
  const TaskInput({
    super.key,
    required this.inputWidth,
    required this.inputHeight,
    required this.controller,
  });

  final double inputWidth;
  final double inputHeight;
  final TextEditingController controller;

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.inputWidth,
      height: widget.inputHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorContraint.secondrayColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(border: InputBorder.none, hintText: ""),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}

class TaskButton extends StatefulWidget {
  const TaskButton({
    super.key,

    required this.buttonText,
    required this.bgColor,
    required this.size,
    this.onTap,
    this.isSelected = false,
  });
  final String buttonText;
  final Color bgColor;
  final Size size;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  State<TaskButton> createState() => _TaskButtonState();
}

enum Priority { high, medium, low }

class _TaskButtonState extends State<TaskButton> {
  @override
  Widget build(BuildContext context) {
    print(ColorContraint.addTaskButton);
    return Row(
      children: [
        ElevatedButton(
          onPressed: widget.onTap,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.black.withOpacity(0.5),
            elevation: 4,
            minimumSize: widget.size,
            backgroundColor: widget.isSelected ? Colors.white : widget.bgColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          child: Text(
            widget.buttonText,

            style: TextStyle(
              color: widget.isSelected
                  ? Colors.black
                  : ColorContraint.primaryFontColor,
              fontWeight: FontContraint.primaryThemeFontWeight,
              fontSize: FontContraint.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}

class TaskDate extends StatefulWidget {
  const TaskDate({
    super.key,
    required this.inputWidth,
    required this.inputHeight,
    required this.controller,
  });
  final double inputWidth;
  final double inputHeight;
  final TextEditingController controller;
  @override
  State<TaskDate> createState() => _TaskDateState();
}

class _TaskDateState extends State<TaskDate> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.inputWidth,
      height: widget.inputHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorContraint.secondrayColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(border: InputBorder.none, hintText: ""),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),

      // child: Padding(
      //   padding: const EdgeInsets.only(left: 10),
      //   child: GestureDetector(
      //     onTap: () async {
      //       DateTime? pickedDate = await showDatePicker(
      //         context: context,
      //         initialDate: DateTime.now(), // today by default
      //         firstDate: DateTime(2000), // earliest year
      //         lastDate: DateTime(2100), // latest year
      //       );

      //       if (pickedDate != null) {
      //         // Format date as DD-MM-YYYY
      //         String formattedDate =
      //             "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      //         setState(() {
      //           controller.text = formattedDate;
      //         });
      //       }
      //     },
      //     child: AbsorbPointer(
      //       // prevent keyboard from opening
      //       child: TextField(
      //         controller: controller,
      //         decoration: InputDecoration(
      //           border: InputBorder.none,
      //           hintText: "",
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
