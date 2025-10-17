import 'package:todo_app/components/task_status/taskStatus.dart';

class Task {
  final String title;
  final Priority priority;
  final String fromDate;
  final String toDate;

  Task({
    required this.title,
    required this.priority,
    required this.fromDate,
    required this.toDate,
  });
}
