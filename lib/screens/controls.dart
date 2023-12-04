import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/utils/device_button.dart';

class Control extends StatefulWidget {
  const Control({super.key});
  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  List smartDevices = [
    [
      const Icon(Icons.lightbulb_outline_rounded,
          size: 30, color: Colors.white),
      "Night Light",
      "Bed Room",
      false,
    ],
    [
      const Icon(Icons.wifi_rounded, size: 30, color: Colors.white),
      "Wifi",
      "Office",
      false,
    ],
    [
      const Icon(Icons.tv_rounded, size: 30, color: Colors.white),
      "TV",
      "Home",
      false,
    ],
    [
      const Icon(Icons.ac_unit_rounded, size: 30, color: Colors.white),
      "AC",
      "Living Room",
      false,
    ],
  ];

  void onPowerChange(bool value, int index) {
    setState(() {
      smartDevices[index][3] = value;
    });
  }

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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white70),
                        ),
                        Text(
                          ' Pavitra',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      'Welcome Back To Home',
                      style: TextStyle(
                          height: 0.5,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54),
                    ),
                  ],
                ),
                InkResponse(
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade900),
                    child: IconButton(
                        icon: const Icon(
                          Icons.grid_view_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {} // Set the color of the icon
                        ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: InkWell(
                child: Container(
                  height: 105,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.greenAccent.withOpacity(0.19),
                      // border:
                      //     Border.all(width: 0.99, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bolt_rounded,
                                size: 80,
                                color: Colors.greenAccent.withOpacity(0.9)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '84.8 kWh',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Colors.greenAccent.withOpacity(0.9)),
                                ),
                                Text(
                                  'Electricity usage of this month',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Colors.greenAccent.withOpacity(0.9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Linked Device',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                ]),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                itemCount: smartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return DeviceButton(
                    icon: smartDevices[index][0],
                    name: smartDevices[index][1],
                    area: smartDevices[index][2],
                    power: smartDevices[index][3],
                    onChange: (value) => onPowerChange(value, index),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
