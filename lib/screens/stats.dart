import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Stats Screen',
                  style: TextStyle(
                      color: Colors.white24,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Under Development ',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.warning_amber_outlined,
                      size: 25,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ],
            )));
  }
}
