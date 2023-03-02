import 'package:flutter/material.dart';
import 'package:zarity_intern_assignment/style/color.dart';

class CtaDialog extends StatelessWidget {
  String title;
  CtaDialog(BuildContext context, this.title);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: AppColor().articlecard,
        height: 300,
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
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor().textcolor),
                ))),
            Icon(
              Icons.question_mark_rounded,
              size: 200,
              color: AppColor().textcolor,
            ),
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
}
