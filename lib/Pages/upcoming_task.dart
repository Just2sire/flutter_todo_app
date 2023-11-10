import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/Models/todo.dart';
import 'package:flutter_todo_app/Pages/add_todo.dart';
import 'package:flutter_todo_app/Pages/home.dart';
import 'package:flutter_todo_app/Pages/inbox.dart';
import 'package:flutter_todo_app/Pages/profile.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'schedule.dart';

class UpcomingTask extends StatefulWidget {
  const UpcomingTask({super.key});

  @override
  State<UpcomingTask> createState() => _UpcomingTaskState();
}

class _UpcomingTaskState extends State<UpcomingTask> {
  List<Task> tasks = [];

  void _getTask() {
    tasks = Task.getTask();
  }

  @override
  void initState() {
    super.initState();
  }

  void navToView(StatefulWidget view) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => view),
    );
  }

  final String formatDate =
      DateFormat('EEEE, dd MMMM').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    _getTask();
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Upcoming Task"),
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
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () => navToView(const ScheduleScreen()),
              child: SvgPicture.asset(
                "assets/icons/apps_icon.svg",
                width: 10,
                height: 20,
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: screenSizePercent(context, 2),
            right: screenSizePercent(context, 2),
            top: 10,
          ),
          margin: EdgeInsets.only(
            left: screenSizePercent(context, 2),
            right: screenSizePercent(context, 2),
            top: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                width: screenSizePercent(
                  context,
                  90,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      formatDate,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                activeColor: Colors.blue.withOpacity(0.7),
                headerProps: const EasyHeaderProps(
                  selectedDateFormat: SelectedDateFormat.monthOnly,
                ),
                dayProps: const EasyDayProps(
                  height: 56.0,
                  width: 56.0,
                  dayStructure: DayStructure.dayNumDayStr,
                  inactiveDayStyle: DayStyle(
                    borderRadius: 48.0,
                    dayNumStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  activeDayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Gap(30),
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Schedule",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TaskAdd(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: const Text("+ Add New"),
                        ),
                      ],
                    ),
                    const Gap(25),
                    SizedBox(
                      // height: screenHeightPercent(context, 80),
                      height: screenHeightPercent(context, 30),
                      child: ListView.separated(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: screenHeightPercent(context, 11),
                            width: 200,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff1D1617).withOpacity(0.07),
                                  offset: const Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    tasks[index].iconPath,
                                    width: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tasks[index].category,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${tasks[index].startTime.format(context)} - ${tasks[index].endTime.format(context)}",
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    // onTap: () {
                                    //   Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const TaskDetail(),
                                    //     ),
                                    //   );
                                    // },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: tasks.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: myBottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navToView(const TaskAdd());
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          mini: false,
          child: const Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
    );
  }

  BottomAppBar myBottomNavBar() {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: Colors.white.withOpacity(0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: IconButton(
              onPressed: () {
                navToView(const FirstPage());
              },
              icon: SvgPicture.asset(
                "assets/icons/home_icon.svg",
                color: Colors.grey,
                width: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 15, bottom: 15),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/calendar_icon.svg",
                color: const Color(0xFF3787EB),
                width: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
            child: IconButton(
              onPressed: () {
                navToView(const InboxScreen());
              },
              icon: SvgPicture.asset(
                "assets/icons/message_icon.svg",
                color: Colors.grey,
                width: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: IconButton(
              onPressed: () {
                navToView(const ProfileScreen());
              },
              icon: SvgPicture.asset(
                "assets/icons/user_circle_icon.svg",
                color: Colors.grey,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
