import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/utils/device_button.dart';

//gradient text
import 'package:simple_gradient_text/simple_gradient_text.dart';

//icons
import 'package:line_icons/line_icons.dart';

//Toast

class Control extends StatefulWidget {
  const Control({super.key});
  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  //for checking API connection status
  String api_endpoint = "";
  bool api_connection_status = true;

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
    if (!api_connection_status) {
      setState(() {
        smartDevices[index][3] = value;
      });
    }
  }

  void openApiModal() async {
    //TODO: add input api here
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CupertinoPageScaffold(
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
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade900),
                          child: IconButton(
                            onPressed: openApiModal,
                            icon: const Icon(
                              LineIcons.powerOff,
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
                        color: api_connection_status
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
                                  color: api_connection_status
                                      ? Colors.greenAccent.withOpacity(0.9)
                                      : Colors.redAccent.withOpacity(0.9)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    api_connection_status
                                        ? '84.8 kWh'
                                        : '--.-- kWh',
                                    style: TextStyle(
                                        height: 1,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: api_connection_status
                                            ? Colors.greenAccent
                                                .withOpacity(0.9)
                                            : Colors.redAccent
                                                .withOpacity(0.9)),
                                  ),
                                  Text(
                                    api_connection_status
                                        ? 'Electricity usage of this month'
                                        : 'Connect to IOT Server',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: api_connection_status
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
      ),
    );
  }
}
