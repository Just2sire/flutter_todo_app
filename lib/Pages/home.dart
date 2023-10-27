import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: myColumn()
    );
  }

  Column myColumn() {
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
                  Color.fromARGB(255, 6, 92, 198)
                ]
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Résumé des progrès du jour",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "15 taches",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Stack(
                        // alignment: Alignment.centerLeft,
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/user_profil.png"),
                            )
                          ),
                          Positioned(
                            left: 25,
                            // top: 20,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/user_profil.png"),
                            )
                          ),
                          Positioned(
                            left: 50,
                            // top: 20,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/user_profil.png"),
                            )
                          ),
                          Positioned(
                            left: 75,
                            // top: 20,
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 6, 92, 198),
                              ),
                            )
                          ),
                          SizedBox(width: 50,),
                          // LinearProgressIndicator(
                          //   value: 40,
                          //   color: Colors.black,
                          //   backgroundColor: Colors.amber,
                          //   semanticsLabel: "Progress",
                          // )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
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
            boxShadow: const [
              BoxShadow(
                color: Colors.black12
              )
            ]),
        child: SvgPicture.asset(
          "assets/icons/apps_icon.svg",
          width: 15,
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
