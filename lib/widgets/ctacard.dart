import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zarity_intern_assignment/screens/ctadialog.dart';

import '../services/functions.dart';
import '../style/color.dart';

class CtaButton extends StatelessWidget {
  String imgUrl;
  String ctaText;
  CtaButton(this.imgUrl, this.ctaText);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: Ink(
            color: AppColor().button,
            child: InkWell(
                splashColor: AppColor().buttonsplash,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CtaDialog(context, ctaText);
                      });
                },
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(imgUrl), fit: BoxFit.fill),
                      ),
                    ),
                    Text(
                      ctaText,
                      style: TextStyle(color: AppColor().textcolor),
                    )
                  ],
                ))));
  }
}

class CtaCard extends StatefulWidget {
  CtaCard({Key? key}) : super(key: key);

  @override
  _CtaCardState createState() => _CtaCardState();
}

class _CtaCardState extends State<CtaCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Widget createButton() {
              var value = snapshot.data?.data()['data'];
              List row = [];
              for (var i in value) {
                row.add(CtaButton(ctaimgUrl(), i));
              }
              return Container(
                  height: 106,
                  child: Card(
                    color: AppColor().cardbackground,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [...row],
                        )),
                  ));
            }

            return createButton();
          }
          return Container(
              height: 106,
              child: Card(
                color: AppColor().cardbackground,
              ));
        });
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection("User").doc("cta").get();
  }
}
