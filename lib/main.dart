import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Pages/home.dart';
import 'package:flutter_todo_app/Pages/schedule.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    const Duration animationDuration = Duration(milliseconds: 1500);
    controller = AnimationController(vsync: this, duration: animationDuration);

    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ScheduleScreen(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF3787EB),
        Color.fromARGB(255, 206, 224, 234),
        Colors.white
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          'assets/images/fast_work.png',
          width: 300,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Text(
                "Bienvenue sur Go Task",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Une application de gestion de tache appelé Todo pour gérer vos différentes taches",
                style: TextStyle(
                    // fontSize: 30,
                    // fontWeight: FontWeight.w700,
                    color: Colors.black38),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const FirstPage()))
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3787EB),
              fixedSize: const Size(425, 50),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15))
          ),
          child: const Text(
            "Commencer",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ]),
    ));
  }
}
