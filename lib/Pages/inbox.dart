import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/Pages/add_todo.dart';
import 'package:flutter_todo_app/Pages/home.dart';
import 'package:flutter_todo_app/Pages/upcoming_task.dart';
import 'package:flutter_todo_app/utils/screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  void initState() {
    super.initState();
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
        appBar: AppBar(
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
            child: SvgPicture.asset(
              "assets/icons/apps_icon.svg",
              width: 10,
              height: 20,
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
        body: Container(
          padding: EdgeInsets.only(
              left: screenSizePercent(context, 3),
              right: screenSizePercent(context, 3)),
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Search ...",
                    hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 17),
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
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              onPressed: () {},
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
