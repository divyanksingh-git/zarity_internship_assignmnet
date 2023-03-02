import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zarity_intern_assignment/style/color.dart';

/*class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(
            iconSize: double.parse("32"),
            backgroundColor: AppColor().cardbackground,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            //unselectedIconTheme: const IconThemeData(color: Colors.white),
            //selectedIconTheme: const IconThemeData(color: Colors.white),
            selectedItemColor: AppColor().navbuttonactive,
            unselectedItemColor: AppColor().navbuttondeactive,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Button-1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Button-2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_services),
                label: 'Button-3',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note_rounded),
                label: 'Button-4',
              ),
            ]),
      ),
    );
  }
}*/

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      backgroundColor: AppColor().background,
      buttonBackgroundColor: AppColor().navbuttonactive,
      color: AppColor().cardbackground,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.linear,
      items: <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: AppColor().textcolor,
        ),
        Icon(Icons.person, size: 30, color: AppColor().textcolor),
        Icon(
          Icons.medical_services,
          size: 30,
          color: AppColor().textcolor,
        ),
        Icon(
          Icons.event_note_rounded,
          size: 30,
          color: AppColor().textcolor,
        ),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
