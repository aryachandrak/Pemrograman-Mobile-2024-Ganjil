import 'package:master_plan/models/task.dart';

class Plan {
  final String name;
  final List<Task> task;
  int get completedCount => task.where((task) => task.complete).length;
  String get completenessMessage =>
      '$completedCount out of ${task.length} tasks';

  const Plan({this.name = '', this.task = const []});
}
