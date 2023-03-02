import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zarity_intern_assignment/services/functions.dart';
import '../screens/settings.dart';
import '../style/color.dart';

class TopBar extends StatefulWidget {
  String greet;

  TopBar(this.greet);

  @override
  _TopBarState createState() => _TopBarState(greet);
}

class _TopBarState extends State<TopBar> {
  String greet;

  _TopBarState(this.greet);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String name = box.read("username");

    box.listenKey('username', (value) {
      debugPrint(value);
      setState(() {
        name = value;
      });
    });

    return Row(
      children: [
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(
                    userimgUrl(),
                    fit: BoxFit.contain,
                    height: 65,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      greet,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(name)
                  ],
                ),
              ],
            )),
        const Spacer(),
        Icon(
          Icons.message_rounded,
          color: AppColor().textcolor,
          size: 32,
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.notifications,
          color: AppColor().textcolor,
          size: 32,
        )
      ],
    );
  }
}
