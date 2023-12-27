import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeviceButton extends StatelessWidget {
  final Widget icon;
  final String name;
  final String area;
  final bool power;
  void Function(bool)? onChange;
  DeviceButton(
      {super.key,
      required this.icon,
      required this.name,
      required this.area,
      required this.power,
      required this.onChange});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                    Text(
                      area,
                      style: const TextStyle(
                          height: 1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      icon,
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: power,
                          onChanged: onChange,
                          activeColor: Colors.greenAccent.shade400,
                          thumbColor: Colors.white,
                        ),
                      )
                    ]),
              ]),
        ));
  }
}
