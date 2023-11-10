import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/Pages/add_todo.dart';
import 'package:flutter_todo_app/Pages/home.dart';
import 'package:flutter_todo_app/Pages/profile.dart';
import 'package:flutter_todo_app/Pages/schedule.dart';
import 'package:flutter_todo_app/Pages/upcoming_task.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<Map> today_contacts = [
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alarick Salzman",
      'status': "Rendre le monde meilleur",
      'createdAt': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Georges Floyd",
      'status': "Rendre le monde meilleur",
      'createdAt': DateTime(2023, 11, 2, 8, 30, 54),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "John Kennedy",
      'status': "Rendre le monde meilleur",
      'createdAt': DateTime(2023, 11, 2, 10, 27, 42),
    },
  ];

  List<Map> yesterday_contacts = [
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "John Doe",
      'status': "Hello world",
      'createdAt': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Alain Prost",
      'status': "Hello world",
      'createdAt': DateTime(2023, 11, 2, 20, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Edith Piath",
      'status': "Hello world",
      'createdAt': DateTime(2023, 11, 2, 07, 10, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "Barry Copa",
      'status': "Hello world",
      'createdAt:': DateTime(2023, 11, 5, 15, 19, 42),
    },
    {
      'image': "assets/icons/user_circle_icon.svg",
      'name': "François Fillon",
      'status': "Hello world",
      'createdAt:': DateTime(2023, 11, 5, 12, 14, 42),
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String compareDate(DateTime inputDate) {
    final now = DateTime.now();
    final difference = inputDate.difference(now);
    print(difference);

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
      // return formatDate(inputDate).toString();
      return "Nice";
    }
  }

  void navToView(StatefulWidget view) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => view),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: myInboxAppBar(),
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: screenHeightPercent(context, 3),
              left: screenSizePercent(context, 3),
              right: screenSizePercent(context, 3),
            ),
            margin: EdgeInsets.only(
              left: screenSizePercent(context, 2),
              right: screenSizePercent(context, 2),
            ),
            width: screenSizePercent(context, 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSizePercent(context, 80),
                  child: TextField(
                    controller: _searchController,
                    onTap: () {},
                    decoration: InputDecoration(
                      hintText: "Search ...",
                      hintStyle: const TextStyle(
                        color: Color(0xffDDDADA),
                        fontSize: 17,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/icons/search_icon.svg',
                            color: Colors.grey,
                            width: 10,
                            height: 10,
                          ),
                        ),
                      ),
                      prefixIconColor: Colors.grey,
                      prefixStyle: const TextStyle(fontSize: 25),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    ),
                    const Gap(10),
                    SizedBox(
                      // height: screenHeightPercent(context, 30),
                      height: (today_contacts.length *
                              screenHeightPercent(context, 9) +
                          today_contacts.length * 10 +
                          20),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: screenHeightPercent(context, 9),
                            width: 150,
                            padding: const EdgeInsets.all(2),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                // left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    today_contacts[index]['image'],
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                today_contacts[index]['name'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                // today_contacts[index]
                                                //         ['createdAt']
                                                //     .toString(),
                                                // compareDate(
                                                //     today_contacts[index]
                                                //         ['createdAt']),
                                                "Nice",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            today_contacts[index]['status']
                                                .toString(),
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
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: today_contacts.length,
                      ),
                    ),
                    const Gap(25),
                    const Text(
                      "Yesterday",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      // height: screenHeightPercent(context, 17),
                      height: (yesterday_contacts.length *
                              screenHeightPercent(context, 9) +
                          yesterday_contacts.length * 10 +
                          20),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: screenHeightPercent(context, 9),
                            width: 150,
                            padding: const EdgeInsets.all(2),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                // left: 10,
                                right: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    yesterday_contacts[index]['image'],
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                yesterday_contacts[index]
                                                    ['name'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                // yesterday_contacts[index]
                                                //         ['createdAt']
                                                //     .toString(),
                                                // compareDate(yesterday_contacts[index]
                                                //         ['createdAt']),
                                                "Nice",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            today_contacts[index]['status']
                                                .toString(),
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
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: today_contacts.length,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar myInboxAppBar() {
    return AppBar(
      title: const Text("Inbox"),
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
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(
            right: 5,
            left: 5,
          ),
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
            "assets/icons/filter_icon.svg",
            color: Colors.grey,
            width: 25,
            height: 25,
          ),
        ),
      ],
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
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/message_icon.svg",
                color: const Color(0xFF3787EB),
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
