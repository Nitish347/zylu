import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zylu/models/employee_model.dart';
import 'package:zylu/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ReadJson();
    setState(() {});
  }

  List<Employee> dataList = <Employee>[];
  Future<void> ReadJson() async {
    final String response = await rootBundle.loadString("assets/data.json");

    final data = await jsonDecode(response);
    dataList = [];
    data.forEach((e) {
      Employee newEmployee;
      newEmployee = Employee.fromMap(e);
      dataList.add(newEmployee);
    });
    print(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Employees Status",
        //     style: GoogleFonts.poppins(fontSize: 20),
        //   ),
        //   centerTitle: true,
        //   leading: IconButton(
        //       onPressed: () => Navigator.pop(context),
        //       icon: Icon(Icons.arrow_back)),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Search for any employee...",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Employees Status",
                    style: GoogleFonts.asap(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(dataList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Tile(
                            name: dataList[index].emp_name,
                            imgUrl: dataList[index].img_url,
                            year: dataList[index].hiring_year),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
