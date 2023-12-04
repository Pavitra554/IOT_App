import 'package:flutter/material.dart';

//Navigation Bar package
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//Screens
import 'package:iot/screens/home.dart';
import 'package:iot/screens/controls.dart';
import 'package:iot/screens/notification.dart';
import 'package:iot/screens/settings.dart';
import 'package:iot/screens/stats.dart';
//icons
import 'package:iconsax/iconsax.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey.shade900,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Iconsax.home_15,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Iconsax.notification1,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Iconsax.airdrop5,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.bar_chart_rounded,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 35,
            color: Colors.white,
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
