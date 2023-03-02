import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zarity_intern_assignment/style/color.dart';
import 'package:zarity_intern_assignment/widgets/topbar.dart';

import '../services/functions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Material(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().background,
      appBar: AppBar(
          backgroundColor: AppColor().background,
          elevation: 0,
          title: Text(
            "Settings",
            style: TextStyle(color: AppColor().textcolor),
          )),
      body: Container(
        padding: EdgeInsets.all(50),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(userimgUrl()), fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: nameController,
            autocorrect: false,
            autofocus: true,
            style: TextStyle(color: AppColor().textcolor),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Change Name',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            color: AppColor().button,
            borderRadius: BorderRadius.circular(30.0),
            child: InkWell(
              onTap: () {
                var name = nameController.text;
                final box = GetStorage();
                nameController.clear();
                box.write("username", name);
                Navigator.pop(context);
              },
              splashColor: AppColor().buttonsplash,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor().textcolor),
                  )),
            ),
          ),
        ]),
      ),
    ));
  }
}
