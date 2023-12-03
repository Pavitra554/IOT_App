import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Control extends StatefulWidget {
  const Control({super.key});
  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          //Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'hello',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    Text(
                      ' Pavitra',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade600),
                    ),
                  ],
                ),
                IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {} // Set the color of the icon
                    ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
