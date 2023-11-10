import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/Models/todo.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Task> tasks = [];

  void _getTask() {
    tasks = Task.getTask();
  }

  static String compareDate(DateTime inputDate) {
    final now = DateTime.now();
    final difference = inputDate.difference(now);

    if (difference.inSeconds < 0) {
      // Si la date est passée
      return inputDate.toString();
    } else if (difference.inMinutes < 60) {
      // Si la différence est inférieure à 1 heure, renvoie en minutes
      return '${difference.inMinutes} minutes';
    } else if (difference.inDays >= 1) {
      // Si la différence est d'au moins 1 jour, renvoie en jours
      return '${difference.inDays} jours';
    } else {
      // Sinon, renvoie la date au format "Date Heure"
      return inputDate.toString();
    }
  }

  List<Map> today_contacts = [
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alarick Salzman",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Georges Floyd",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 8, 30, 54),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "John Kennedy",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 10, 27, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alarick Salzman",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alarick Salzman",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alarick Salzman",
      'status': "Rendre le monde meilleur",
      'createdAt:': DateTime(2023, 11, 2, 20, 19, 42),
    },
  ];

  @override
  Widget build(BuildContext context) {
    _getTask();

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Schedule"),
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          elevation: 0.0,
          leading: Container(
            margin: const EdgeInsets.all(10),
            width: 10,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeightPercent(context, 100),
            padding: EdgeInsets.all(screenSizePercent(context, 3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeightPercent(context, 40),
                  // width: screenSizePercent(context, 90),
                  child: Calendar(
                    startOnMonday: true,
                    weekDays: const ['Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa', 'Di'],
                    isExpandable: false,
                    selectedColor: Colors.blue.withOpacity(0.8),
                    selectedTodayColor: Colors.blue,
                    todayColor: Colors.blue,
                    locale: 'fr_FR',
                    hideBottomBar: true,
                    hideTodayIcon: true,
                    // todayButtonText: 'Aujourd\'hui',
                    multiDayEndText: 'Fin',
                    isExpanded: true,
                    expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                    datePickerType: DatePickerType.date,
                    dayOfWeekStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: EdgeInsets.only(left: screenSizePercent(context, 5)),
                  child: const Text(
                    "Added Task",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: SizedBox(
                    // height: screenHeightPercent(context, 80),
                    height: (today_contacts.length *
                            screenHeightPercent(context, 9) +
                        today_contacts.length * 15 +
                        20),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Container(
                          height: screenHeightPercent(context, 11),
                          width: screenSizePercent(context, 90),
                          padding: const EdgeInsets.all(2),
                          color: Colors.amber[20],
                          child: Padding(
                            padding: const EdgeInsets.only(
                              // left: 10,
                              right: 10,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  tasks[index].iconPath,
                                  width: 50,
                                ),
                                const Gap(20),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tasks[index].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${tasks[index].startTime.format(context)} - ${tasks[index].endTime.format(context)}",
                                          style: const TextStyle(
                                              color: Color(0xffDDDADA)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) => const Gap(3),
                      itemCount: tasks.length,
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: () {}, child: const Text("Hi guys"),)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("Hello"),
          // shape: RoundedRectangleBorder(borderRadius: Radius.),
        ),
      ),
    );
  }
}
