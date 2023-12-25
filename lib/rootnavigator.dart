import 'package:flutter/material.dart';

//Navigation Bar package
import 'package:google_nav_bar/google_nav_bar.dart';

//Screens
import 'package:iot/screens/home.dart';
import 'package:iot/screens/controls.dart';
import 'package:iot/screens/settings.dart';

//icons
import 'package:line_icons/line_icons.dart';

class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});
  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        color: Colors.black,
        child: GNav(
          backgroundColor: Colors.black,
          rippleColor: Colors.grey.shade900,
          tabBackgroundColor: Colors.grey.shade900,
          hoverColor: Colors.grey.shade900,
          activeColor: Colors.white,
          color: Colors.grey.shade400,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 400),
          gap: 6,
          iconSize: 30,
          onTabChange: (selctedIndex) {
            setState(() {
              index = selctedIndex;
            });
          },
          selectedIndex: index,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: "Home",
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            GButton(
              icon: LineIcons.podcast,
              text: "Devices",
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            GButton(
              icon: LineIcons.cog,
              text: "Settings",
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const Control();
        break;
      case 2:
        widget = const Settings();
        break;
      default:
        widget = const Control();
        break;
    }
    return widget;
  }
}
