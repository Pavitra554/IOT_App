import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/utils/device_button.dart';

//gradient text
import 'package:simple_gradient_text/simple_gradient_text.dart';

//icons
import 'package:line_icons/line_icons.dart';

//QuickAlert
import 'package:quickalert/quickalert.dart';

//http
import 'package:http/http.dart' as http;

class Control extends StatefulWidget {
  const Control({super.key});
  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  //for checking API connection status
  bool apiConnectionStatus = false;

  // currently added devices
  List smartDevices = [
    [
      const Icon(LineIcons.lightbulb, size: 35, color: Colors.white),
      "Night Light",
      "Bed Room",
      false,
    ],
    [
      const Icon(LineIcons.wifi, size: 35, color: Colors.white),
      "Wifi",
      "Office",
      false,
    ],
    [
      const Icon(LineIcons.television, size: 35, color: Colors.white),
      "TV",
      "Home",
      false,
    ],
    [
      const Icon(LineIcons.snowflake, size: 35, color: Colors.white),
      "AC",
      "Living Room",
      false,
    ],
  ];

  void onPowerChange(bool value, int index) async {
    if (!apiConnectionStatus) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          animType: QuickAlertAnimType.slideInUp,
          borderRadius: 25,
          title: "Error :(",
          text: "Connect to IOT server.",
          textColor: Colors.white,
          backgroundColor: Colors.grey.shade900,
          showConfirmBtn: false);
    } else {
      setState(() {
        smartDevices[index][3] = value;
      });
      toggleLight(
          "https://c949-2401-4900-1c37-9db5-9c7b-7d39-aae9-1025.Ngrok-free.app",
          smartDevices[index][3]);
    }
  }

  Future<Map<String, dynamic>> connectServer() async {
    try {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          animType: QuickAlertAnimType.slideInUp,
          borderRadius: 25,
          title: "Connecting to server...",
          text: "wait for a few seconds.",
          textColor: Colors.white,
          backgroundColor: Colors.grey.shade900,
          showConfirmBtn: true,
          confirmBtnText: "Wait...");
      final response = await http.get(Uri.parse(
          "https://c949-2401-4900-1c37-9db5-9c7b-7d39-aae9-1025.Ngrok-free.app"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // ignore: use_build_context_synchronously
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          animType: QuickAlertAnimType.slideInUp,
          borderRadius: 25,
          title: "Server Connected",
          textColor: Colors.white,
          showConfirmBtn: true,
          backgroundColor: Colors.grey.shade900,
        );
        setState(() {
          apiConnectionStatus = !apiConnectionStatus;
        });
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> toggleLight(
      String apiendpoint, bool currVal) async {
    try {
      if (currVal) {
        apiendpoint =
            "https://c949-2401-4900-1c37-9db5-9c7b-7d39-aae9-1025.Ngrok-free.app/turn-off";
      } else {
        apiendpoint =
            "https://c949-2401-4900-1c37-9db5-9c7b-7d39-aae9-1025.Ngrok-free.app/turn-on";
      }
      final response = await http.get(Uri.parse(apiendpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data');
    }
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
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'ProHome',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  colors: const [
                    Colors.deepPurpleAccent,
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
                InkResponse(
                    child: Container(
                        height: 45,
                        width: 45,
                        // alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade900),
                        child: IconButton(
                          onPressed: () async {
                            if (!apiConnectionStatus) {
                              await connectServer();
                            }
                          },
                          icon: Icon(
                            apiConnectionStatus
                                ? LineIcons.server
                                : LineIcons.powerOff,
                            size: 25,
                            color: Colors.white,
                          ),
                        ))),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: InkWell(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: apiConnectionStatus
                          ? Colors.greenAccent.withOpacity(0.19)
                          : Colors.redAccent.withOpacity(0.19),
                      // border:
                      //     Border.all(width: 0.99, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bolt_rounded,
                                size: 60,
                                color: apiConnectionStatus
                                    ? Colors.greenAccent.withOpacity(0.9)
                                    : Colors.redAccent.withOpacity(0.9)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiConnectionStatus
                                      ? '84.8 kWh'
                                      : '--.-- kWh',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: apiConnectionStatus
                                          ? Colors.greenAccent.withOpacity(0.9)
                                          : Colors.redAccent.withOpacity(0.9)),
                                ),
                                Text(
                                  apiConnectionStatus
                                      ? 'Electricity usage of this month'
                                      : 'Server Disconnected',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: apiConnectionStatus
                                        ? Colors.greenAccent.withOpacity(0.9)
                                        : Colors.redAccent.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Linked Device',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                ]),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
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
