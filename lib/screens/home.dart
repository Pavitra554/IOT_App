import 'package:flutter/material.dart';

//Lottie Animation
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/error.json',
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Home Screen',
                  style: TextStyle(
                      color: Colors.white24,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Under Development ',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.warning_amber_outlined,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ],
            )));
  }
}
