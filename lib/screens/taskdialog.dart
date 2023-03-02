import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zarity_intern_assignment/style/color.dart';

class TaskDialog extends StatefulWidget {
  TaskDialog({Key? key}) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  dynamic table(
    t1,
    t2,
    t3,
    w,
  ) {
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(3),
          child: Text(
            t1,
            style: TextStyle(color: AppColor().textcolor, fontWeight: w),
            textAlign: TextAlign.center,
          )),
      Container(
          padding: EdgeInsets.all(3),
          child: Text(
            t2,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor().textcolor, fontWeight: w),
          )),
      Container(
          padding: EdgeInsets.all(3),
          child: Text(
            t3,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor().textcolor, fontWeight: w),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Widget createTable() {
              var map = snapshot.data?.data();
              List<TableRow> rows = [];
              map?.keys.forEach((key) {
                rows.add(table(
                    map[key][0], map[key][1], map[key][2], FontWeight.normal));
              });
              return Table(
                border: TableBorder.symmetric(
                    outside:
                        BorderSide(width: 2, color: AppColor().bordercolor)),
                children: [
                  table("Task", "Due", "Cta", FontWeight.bold),
                  table("", "", "", FontWeight.normal),
                  ...rows
                ],
              );
            }

            return Dialog(
              child: Container(
                height: 300,
                color: AppColor().articlecard,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Container(
                        color: AppColor().tasklist,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(3),
                        child: Center(
                            child: Text(
                          "Task List",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor().textcolor),
                        ))),
                    Center(
                        child: Container(
                            margin: EdgeInsets.all(10), child: createTable())),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor().taskbutton),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(color: AppColor().textcolor),
                        )),
                    SizedBox()
                  ],
                ),
              ),
            );
          }
          return const Text("");
        });
  }
}

Future<DocumentSnapshot> getData() async {
  await Firebase.initializeApp();
  return await FirebaseFirestore.instance.collection("User").doc("task").get();
}
