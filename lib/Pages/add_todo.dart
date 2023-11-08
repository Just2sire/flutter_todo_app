import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo_app/Pages/task_details.dart';
import 'package:flutter_todo_app/utils/screen.dart';
import 'package:gap/gap.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  // TextEditingController _taskName = TextEditingController();

  List<Map<String, dynamic>> categories = [
    {
      "name": "UI Design",
      "isSelected": true,
    },
    {
      "name": "Web Development",
      "isSelected": false,
    },
    {
      "name": "Office Meetings",
      "isSelected": false,
    },
    {
      "name": "Dashboard Design",
      "isSelected": false,
    },
    {
      "name": "Autres",
      "isSelected": false,
    },
  ];

  void _setCategorySelected(int id) {
    for (var category in categories) {
      category['isSelected'] = false;
    }
    categories[id]['isSelected'] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAddTaskAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(
            left: screenSizePercent(context, 2),
            right: screenSizePercent(context, 2),
            top: 5,
          ),
          margin: EdgeInsets.only(
            left: screenSizePercent(context, 2),
            right: screenSizePercent(context, 2),
            top: 5,
          ),
          child: Column(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Name",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Gap(15),
                  SizedBox(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Coder Gozem",
                        hintStyle: TextStyle(color: Color(0xffDDDADA)),
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffDDDADA),
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
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categorie",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const Gap(7),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _setCategorySelected(index);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: categories[index]['isSelected']
                                ? const Color(0xFF3787EB)
                                : const Color.fromRGBO(236, 244, 253, 0.4),
                            // fixedSize: const Size(425, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Text(
                            categories[index]['name'],
                            style: TextStyle(
                                color: categories[index]['isSelected']
                                    ? Colors.white
                                    : Colors.black87),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Date & Heure",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const Gap(7),
                  SizedBox(
                    height: 55,
                    child: TextField(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                      },
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "01 November, 2023",
                        hintStyle: TextStyle(
                          color: Color(0xffDDDADA),
                        ),
                        contentPadding: EdgeInsets.all(20),
                        suffixIcon: Icon(Icons.calendar_month),
                        suffixIconColor: Colors.blue,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Color(0xffDDDADA),
                            // width: 1,
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
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Start Time",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Gap(7),
                      SizedBox(
                        width: screenSizePercent(context, 43),
                        height: 55,
                        child: TextField(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                          decoration: InputDecoration(
                            // label: const Text("08:30 AM"),
                            hintText: "08:30 AM",
                            hintStyle:
                                const TextStyle(color: Color(0xffDDDADA)),
                            labelStyle: const TextStyle(fontSize: 14),
                            contentPadding: const EdgeInsets.all(20),
                            suffix: SvgPicture.asset(
                              'assets/icons/down_arrow.svg',
                              width: 20,
                            ),
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
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "End Time",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Gap(7),
                      SizedBox(
                        width: screenSizePercent(context, 43),
                        height: 55,
                        child: TextField(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                          decoration: InputDecoration(
                            // label: const Text("08:30 AM"),
                            hintText: "08:30 AM",
                            hintStyle:
                                const TextStyle(color: Color(0xffDDDADA)),
                            labelStyle: const TextStyle(fontSize: 14),
                            contentPadding: const EdgeInsets.all(20),
                            suffix: SvgPicture.asset(
                              'assets/icons/down_arrow.svg',
                              width: 20,
                            ),
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
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              const SizedBox(
                // padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                // margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
                // height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date & Heure",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(15),
                    SizedBox(
                      child: TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          hintText:
                              "Essayer de passer le plus de temps à m'excercer sur  Flutter et devenir un bon développeur dans cette techno",
                          hintStyle: TextStyle(
                            color: Color(0xffDDDADA),
                            fontSize: 18,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
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
              const Gap(25),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TaskDetail(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3787EB),
                  fixedSize: const Size(410, 63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Create Task",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Gap(7),
            ],
          ),
        ),
      ),
    );
  }

  AppBar myAddTaskAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Create New Task"),
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
    );
  }
}
