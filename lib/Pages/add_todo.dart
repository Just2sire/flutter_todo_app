import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        title: const Text("Create New Task"),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        elevation: 0.0,
        leading: Container(
            margin: const EdgeInsets.all(10),
            width: 10,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
              ),
            )),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            // height: 100,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Task Name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      label: Text("Coder Gozem"),
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                )
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "Categorie",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // width: 350,
                height: 50,
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
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
                                borderRadius: BorderRadius.circular(7))),
                        child: Text(
                          categories[index]['name'],
                          style: TextStyle(
                              color: categories[index]['isSelected'] ? Colors.white : Colors.black87),
                        ),
                      ),
                    );
                  },
                  // children: [
                  //   ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text("Hello"),
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: const Color(0xFF3787EB),
                  //         fixedSize: const Size(425, 50),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(15)
                  //         )
                  //     ),
                  // )
                  // ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            // height: 100,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date & Heure",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  // textInputAction: ,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      // icon: SvgPicture.asset("assets/icons/calendar_icon.svg"),
                      icon: Icon(Icons.calendar_month),
                      iconColor: Colors.blue,
                      label: Text("Coder Gozem"),
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
