import 'package:flutter/material.dart';
import 'package:todo_app/utils/color_contraint.dart';
import 'package:todo_app/utils/font_contraint.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.iconData,
    required this.taskDate,
    required this.titleTask,
    required this.titleDescrip,
  });

  final IconData iconData;
  final String taskDate;
  final String titleTask;
  final String titleDescrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorContraint.taskCardGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(iconData, color: ColorContraint.taskCardHighlight, size: 28),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                taskDate,
                style: TextStyle(
                  fontSize: FontContraint.tiny,
                  color: ColorContraint.taskCardHighlight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            titleTask,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: FontContraint.subtitle,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            titleDescrip,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: FontContraint.tiny,
              color: ColorContraint.taskCardHighlight,
            ),
          ),
        ],
      ),
    );
  }
}
