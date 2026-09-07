import 'package:flutter/material.dart';

class TaskItem {
  String title, time, level;
  bool done;
  final IconData icon;
  TaskItem(this.title, this.time, this.level, this.icon, {this.done=false});
}
class HabitItem {
  String title;
  int done, total;
  final IconData icon;
  HabitItem(this.title, this.done, this.total, this.icon);
}
class GoalItem {
  String title, subtitle;
  double progress;
  final IconData icon;
  GoalItem(this.title, this.subtitle, this.progress, this.icon);
}

final tasks = <TaskItem>[
  TaskItem('Study Flutter', '2:00 PM - 4:00 PM', 'High', Icons.code_rounded),
  TaskItem('Workout', '5:00 PM - 6:00 PM', 'Medium', Icons.fitness_center_rounded),
  TaskItem('Read Book', '8:00 PM - 9:00 PM', 'Low', Icons.menu_book_rounded),
  TaskItem('Project Work', '9:00 PM - 10:00 PM', 'High', Icons.rocket_launch_rounded),
];

final habits = <HabitItem>[
  HabitItem('Prayer', 5, 5, Icons.mosque_rounded),
  HabitItem('Workout', 3, 5, Icons.fitness_center_rounded),
  HabitItem('Read Book', 4, 5, Icons.menu_book_rounded),
  HabitItem('Drink Water', 6, 8, Icons.water_drop_rounded),
  HabitItem('Study', 4, 5, Icons.school_rounded),
];

final goals = <GoalItem>[
  GoalItem('Become Flutter Developer', '4 milestones completed', .65, Icons.code_rounded),
  GoalItem('Get Fit & Healthy', '4 / 7 steps', .57, Icons.favorite_rounded),
  GoalItem('Read 12 Books', '3 books completed', .25, Icons.auto_stories_rounded),
];

class AppData {
  static String userName = 'Hassan Ibrahim';
  static int lifeScore = 82;
}
