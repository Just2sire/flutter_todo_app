import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    // DateTime date = DateTime.now();

    Map task = {
      'endDate': DateTime.now(),
      'progress': 75.0,
      'description':
          "The project will incorporate several popular web development technologies. Much of the time, the tools and programming languages taught in a classroom setting are learned and praticed in isolation from one another",
      'menbers': 5
    };

    List<Map> taskDetails = [
      {
        'name': "Introduction",
        'icon': "assets/icons/introduction_icon.svg",
        'author': "John Doe",
        'color': const Color(0xFFECF4FD),
        'isDone': false,
      },
      {
        'name': "Project deatil",
        'icon': "assets/icons/description_icon.svg",
        'author': "John Doe",
        'color': const Color(0xFFFFF2EB),
        'isDone': false,
      },
      {
        'name': "Conclusion",
        'icon': "assets/icons/conclusion_icon.svg",
        'author': "John Doe",
        'color': const Color(0xFFECF4FD),
        'isDone': true,
      },
    ];

    @override
    void initState() {
      super.initState();
    }

    String formatDate =
        DateFormat("dd MMMM, 'at' hh:mm a").format(task['endDate']).toString();

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Task Details"),
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
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: screenSizePercent(context, 2), right: screenSizePercent(context, 2), top: 10),
              margin: EdgeInsets.only(left: screenSizePercent(context, 2), right: screenSizePercent(context, 2), top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Web Developpement",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3787EB).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/calendar_contained_icon.svg",
                          color: const Color(0xFF3787EB),
                          width: 30,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        formatDate,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const Gap(30),
                  SizedBox(
                    width: 384,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "En cours",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${task['progress']}%",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        width: screenSizePercent(context, 90),
                        height: 10,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3787EB).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: screenSizePercent(context, 90,) * task['progress'] / 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3787EB),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(15),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "${task['description'].substring(0, 176)} ... Read More",
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Menbers",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(15),
                      Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3787EB).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            const Positioned(
                              left: 0,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 30,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 60,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 90,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 120,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 150,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 180,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 210,
                              child: SizedBox(
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/user_profil.png",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 240,
                              child: GestureDetector(
                                onTap: () => {},
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF3787EB),
                                    // size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: screenHeightPercent(context, 45),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
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
                                    color: taskDetails[index]['color'],
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
                                      taskDetails[index]['icon'],
                                      width: 50,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          taskDetails[index]['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${taskDetails[index]['author']}",
                                        ),
                                      ],
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.amber[100],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Checkbox(
                                        shape: const CircleBorder(),
                                        checkColor: taskDetails[index]['color'],
                                        activeColor: Colors.amber,
                                        // visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.5),
                                        // fillColor: MaterialStateProperty.resolveWith(taskDetails[index]['color']),
                                        value: taskDetails[index]['isDone'],
                                        onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
                                          setState(() {
                                            taskDetails[index]['isDone'] = value! ? false : true;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: taskDetails.length,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
