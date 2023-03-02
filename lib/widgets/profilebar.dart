import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../screens/taskdialog.dart';
import '../style/color.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor().cardbackground,
      child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return TaskDialog();
                });
          },
          splashColor: AppColor().cardsplash,
          child: Row(children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: .7,
                  center: Text(
                    "70%",
                    style: TextStyle(color: AppColor().textcolor),
                  ),
                  progressColor: AppColor().progress,
                )),
            const SizedBox(
              width: 15,
            ),
            Flexible(
                child: Text(
              "Please Complete your profile to book conseltations",
              style: TextStyle(color: AppColor().textcolor),
              overflow: TextOverflow.visible,
            )),
          ])),
    );
  }
}
