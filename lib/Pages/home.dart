import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_app/Models/todo.dart';
import 'package:flutter_todo_app/Pages/add_todo.dart';
import 'package:flutter_todo_app/Pages/inbox.dart';
import 'package:flutter_todo_app/Pages/profile.dart';
import 'package:flutter_todo_app/Pages/task_details.dart';
import 'package:flutter_todo_app/Pages/upcoming_task.dart';
import 'package:flutter_todo_app/utils/screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Task> tasks = [];

  void _getTask() {
    tasks = Task.getTask();
  }

  void navToView(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  @override
  Widget build(BuildContext context) {
    _getTask();
    return Scaffold(
      appBar: myAppBar(),
      body: myBody(),
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
      bottomNavigationBar: myBottomNavBar(),
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
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/home_icon.svg",
                color: const Color(0xFF3787EB),
                width: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 15, bottom: 15),
            child: IconButton(
              onPressed: () {
                navToView(const UpcomingTask());
              },
              icon: SvgPicture.asset(
                "assets/icons/calendar_icon.svg",
                color: Colors.grey,
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

  Column myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              width: screenSizePercent(context, 90),
              padding: EdgeInsets.only(
                  left: screenSizePercent(context, 2),
                  top: 20,
                  bottom: 15,
                  right: screenSizePercent(context, 2)),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 85, 150, 230),
                    Color.fromARGB(255, 6, 92, 198),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Résumé des progrès du jour",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "15 taches",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              const Positioned(
                                  child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/user_profil.png"),
                              )),
                              const Positioned(
                                  left: 15,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profil.png"),
                                  )),
                              const Positioned(
                                  left: 30,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profil.png"),
                                  )),
                              Positioned(
                                left: 45,
                                child: GestureDetector(
                                  onTap: () => navToView(const TaskAdd()),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF3787EB),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 180,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Progrès",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "25%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 180,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: (45),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tache Du Jour",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UpcomingTask(),
                        ),
                      ),
                    },
                    child: const Text(
                      "Voir tout",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            tasks.isNotEmpty
                ? SizedBox(
                    height: screenHeightPercent(context, 40),
                    width: screenSizePercent(context, 90),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 90,
                          width: 50,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  tasks[index].iconPath,
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TaskDetail(),
                                      ),
                                    );
                                  },
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
                      itemCount: tasks.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                    ),
                  )
                : const Text("Aucune tache")
          ],
        ),
      ],
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("Homepage"),
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
        padding: const EdgeInsets.only(right: 5, left: 5,),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          "assets/icons/apps_icon.svg",
          width: 10,
          height: 20,
        ),
      ),
      actions: [
        Container(
          margin:
              const EdgeInsets.only(top: 13, bottom: 4, right: 10, left: 10),
          padding: const EdgeInsets.only(right: 5, left: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
          child: SvgPicture.asset(
            "assets/icons/notif_icon.svg",
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}
