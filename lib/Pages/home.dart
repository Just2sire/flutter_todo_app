import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_app/Models/todo.dart';
// import 'package:flutter/src/material/bottom_navigation_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    _getTask();
    return Scaffold(
        appBar: myAppBar(), 
        body: myBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          mini: false,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: const CircularNotchedRectangle(),
          color: Colors.white.withOpacity(0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15
                ),
                child: SvgPicture.asset(
                  "assets/icons/home_icon.svg",
                  color: Colors.grey,
                  width: 30
                )
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  top: 15,
                  bottom: 15
                ),
                child: SvgPicture.asset(
                  "assets/icons/calendar_icon.svg",
                  color: Colors.grey,
                  width: 30
                )
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 15,
                  bottom: 15
                ),
                child: SvgPicture.asset(
                  "assets/icons/message_icon.svg",
                  color: Colors.grey,
                  width: 30
                )
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15
                ),
                child: SvgPicture.asset(
                  "assets/icons/user_circle_icon.svg",
                  color: Colors.grey,
                  width: 30
                )
              )
            ],
          ),
        ),
    );
  }
  Column myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              width: 450,
              padding: const EdgeInsets.only(left: 10, top: 20, bottom: 15, right: 15),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 85, 150, 230),
                  Color.fromARGB(255, 6, 92, 198),
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        const Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user_profil.png"),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user_profil.png"),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user_profil.png"),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user_profil.png"),
                            ),
                            CircleAvatar(
                              // backgroundImage: AssetImage("assets/images/user_profile.png"),
                              child: Icon(Icons.add),
                            )
                            // Positioned(
                            //     child: CircleAvatar(
                            //   backgroundImage:
                            //       AssetImage("assets/images/user_profil.png"),
                            // )),
                            // Positioned(
                            //     left: 25,
                            //     child: CircleAvatar(
                            //       backgroundImage: AssetImage(
                            //           "assets/images/user_profil.png"),
                            //     )),
                            // Positioned(
                            //     left: 50,
                            //     child: CircleAvatar(
                            //       backgroundImage: AssetImage(
                            //           "assets/images/user_profil.png"),
                            //     )),
                            // Positioned(
                            //     left: 75,
                            //     child: CircleAvatar(
                            //       backgroundImage: AssetImage(
                            //           "assets/images/user_profil.png"),
                            //     )),
                            // Positioned(
                            //     left: 100,
                            //     child: CircleAvatar(
                            //       // backgroundImage: AssetImage("assets/images/user_profile.png"),
                            //       child: Icon(Icons.add),
                            //     )),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Progrès",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Text(
                                    "25%",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: (45),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
        Container(
          child: Column(
            children: [
              Container(
                // color: Colors.amber,
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tache Du Jour",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () => print("Click"),
                      child: const Text(
                        "Voir tout",
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                      ),
                    )
                  ],
                ),
              ),
              tasks.isNotEmpty
                  ? Container(
                      height: 385,
                      width: 350,
                      // color: Colors.black,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
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
                                      color: const Color(0xff1D1617)
                                          .withOpacity(0.07),
                                      offset: const Offset(0, 10),
                                      blurRadius: 40,
                                      spreadRadius: 0),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
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
                                          "${tasks[index].startTime.format(context)} - ${tasks[index].endTime.format(context)}"),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 17,
                                    ),
                                  )
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
                  : Text("Aucune tache")
            ],
          ),
        )
      ],
    );
  }
  AppBar myAppBar() {
    return AppBar(
      title: const Text("Homepage"),
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      elevation: 0.0,
      // leading: const Icon(Icons.apps_rounded, color: Colors.black,),
      leading: Container(
        margin: const EdgeInsets.all(14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(color: Colors.black12)]),
        child: SvgPicture.asset(
          "assets/icons/apps_icon.svg",
          width: 5,
          height: 15,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                )
              ]),
          child: SvgPicture.asset(
            "assets/icons/notification_icon.svg",
            width: 25,
            height: 25,
          ),
        )
      ],
    );
  }
}
