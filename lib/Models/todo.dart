import 'package:flutter/material.dart';

class Task {
  String name;
  String iconPath = "assets/icons/other_icon1.svg";
  String category;
  TimeOfDay startTime;
  TimeOfDay endTime;
  DateTime createdAt = DateTime.now();

  Task({
    required this.name,
    required this.category,
    required this.startTime,
    required this.endTime,
    required this.iconPath,
    // iconPath = "assets/icons/ui_icon.svg",
    required this.createdAt,
  });

  static List<Task> getTask() {
    List<Task> tasks = [];

    tasks.add(Task(
        name: 'Acheter des courses',
        category: 'Courses',
        iconPath: 'assets/icons/ui_icon.svg',
        startTime: const TimeOfDay(hour: 8, minute: 0),
        endTime: const TimeOfDay(hour: 18, minute: 30),
        createdAt: DateTime(2023, 11, 2, 20, 19, 42)));

    tasks.add(Task(
      name: "Réunion avec l'équipe",
      category: 'Travail',
      iconPath: 'assets/icons/web_code_icon1.svg',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 18, minute: 30),
      createdAt: DateTime(2023, 11, 2, 20, 19, 42),
    ));

    tasks.add(Task(
      name: "Faire de l'exercice",
      category: 'Santé',
      iconPath: 'assets/icons/office_meeting_icon.svg',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 18, minute: 30),
      createdAt: DateTime(2023, 11, 8, 12, 14, 42),
    ));

    tasks.add(Task(
      name: 'Réparer la porte',
      category: 'Maison',
      iconPath: 'assets/icons/idea_icon1.svg',
      startTime: const TimeOfDay(hour: 8, minute: 0),
      endTime: const TimeOfDay(hour: 18, minute: 30),
      createdAt: DateTime(2023, 11, 8, 14, 52, 42),
    ));

    return tasks;
  }

  // List<Map> all() {
  //   return tasks;
  // }

  // String add(
  //     {required name,
  //     required category,
  //     required TimeOfDay startTime,
  //     required TimeOfDay endTime,
  //     DateTime? createdAt,
  //     String? iconPath}) {
  //   Map task = {
  //     name: name,
  //     category: category,
  //     startTime: startTime,
  //     iconPath: iconPath,
  //     endTime: endTime,
  //     createdA': DateTime.now()
  //   };
  //   tasks.add(task);
  //   return "Tache enregistré avec succès";
  // }

  // Map show(int id) {
  //   Map task = tasks[id];
  //   return task;
  // }

  // Task.add();
}

Task exple = Task(
  name: 'Réparer la porte',
  category: 'Maison',
  iconPath: 'assets/icons/idea_icon.svg',
  startTime: const TimeOfDay(hour: 8, minute: 0),
  endTime: const TimeOfDay(hour: 18, minute: 30),
  createdAt: DateTime.now(),
);

// List<Task> exple = Task.getTask();