import 'package:flutter/material.dart';

//Navigation Bar package
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//Screens
import 'package:iot/screens/home.dart';
import 'package:iot/screens/controls.dart';
import 'package:iot/screens/notification.dart';
import 'package:iot/screens/settings.dart';
import 'package:iot/screens/stats.dart';

class RootNavigator extends StatefulWidget {
  const RootNavigator({super.key});
  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey.shade900,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white70,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white70,
          ),
          Icon(
            Icons.wifi,
            color: Colors.white70,
          ),
          Icon(
            Icons.dashboard,
            color: Colors.white70,
          ),
          Icon(
            Icons.settings,
            color: Colors.white70,
          ),
        ],
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
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
        widget = const NotificationSc();
        break;
      case 2:
        widget = const Control();
        break;
      case 3:
        widget = const Stats();
        break;
      case 4:
        widget = const Settings();
        break;
      default:
        widget = const Control();
        break;
    }
    return widget;
  }
}
