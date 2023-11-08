import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_app/Pages/add_todo.dart';
import 'package:flutter_todo_app/Pages/home.dart';
import 'package:flutter_todo_app/Pages/inbox.dart';
import 'package:flutter_todo_app/Pages/upcoming_task.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  void navToView(Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
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
              "assets/icons/apps_icon.svg",
              width: 10,
              height: 20,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
              left: screenSizePercent(context, 3),
              right: screenSizePercent(context, 3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeightPercent(context, 3)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFF3787EB), width: 3),
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          width: screenHeightPercent(context, 19),
                          height: screenHeightPercent(context, 19),
                          // child: Image.asset("assets/images/user_profil.png", fit: BoxFit.contain,),
                          child: SvgPicture.asset(
                            "assets/icons/user_circle_icon.svg",
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    const Text(
                      "Marcel Pagnol",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Gap(27),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/edit_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(7),
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/password_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Change Password",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(7),
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/location_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Turn On Location",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Switch(
                            value: false,
                            onChanged: (bool? value) {},
                            activeColor: const Color(0xFF3787EB),
                          ),
                        ],
                      ),
                    ),
                    const Gap(7),
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/send_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Email Notifications",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          Switch(
                            value: false,
                            onChanged: (bool? value) {},
                            activeColor: const Color(0xFF3787EB),
                          ),
                        ],
                      ),
                    ),
                    const Gap(7),
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/settings_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(7),
                    SizedBox(
                      width: screenSizePercent(context, 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/logout_icon.svg",
                                width: 23,
                              ),
                              const Gap(15),
                              const Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Gap(20),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                // navToView(const ProfileScreen());
              },
              icon: SvgPicture.asset(
                "assets/icons/user_circle_icon.svg",
                color: const Color(0xFF3787EB),
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
