import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../services/functions.dart';
import '../style/color.dart';
import '../widgets/articlecard.dart';
import '../widgets/bottombar.dart';
import '../widgets/ctacard.dart';
import '../widgets/profilebar.dart';
import '../widgets/topbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    box.write("username", "User");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColor().background,
          appBar: AppBar(
            backgroundColor: AppColor().background,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            )),
            elevation: 0,
            toolbarHeight: 75,
            title: TopBar("Welcome"),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ProfileBar(),
                Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Selection Title 1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor().textcolor),
                    )),
                CtaCard(),
                const SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Selection Title 2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor().textcolor),
                    )),
                Card(
                  color: AppColor().cardbackground,
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(docimgUrl()), fit: BoxFit.fill),
                      ),
                    ),
                    Flexible(
                        child: RichText(
                      text: TextSpan(
                          text: 'Doc Name\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor().textcolor),
                          children: const [
                            TextSpan(
                                text: 'Sub Text Shown here',
                                style: TextStyle(fontWeight: FontWeight.normal))
                          ]),
                      overflow: TextOverflow.visible,
                    )),
                    const Spacer(),
                    Material(
                      color: AppColor().button,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        onTap: () {},
                        splashColor: AppColor().buttonsplash,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text(
                              'CTA',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor().textcolor),
                            )),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Card(
                        color: AppColor().cardbackground,
                        child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(5),
                                alignment: Alignment.topLeft,
                                child: Row(children: [
                                  Text(
                                    "Card Title",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor().textcolor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Material(
                                    color: AppColor().button,
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: InkWell(
                                      onTap: () {},
                                      splashColor: AppColor().buttonsplash,
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          child: Text(
                                            'View All',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor().textcolor),
                                          )),
                                    ),
                                  ),
                                ])),
                            ArticleCard(),
                          ],
                        ))),
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(),
        ));
  }
}
