import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceBox extends StatelessWidget {
  final String name;
  final String path;
  final bool power;
  final void Function(bool)? onChanged;

  const DeviceBox({super.key, required this.name,required this.path, required this.power, required this.onChanged});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: power? Colors.black: Colors.grey[200], 
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Image.asset(path, height: 60, color: power ? Colors.grey[200]:Colors.black,),
          Row(
              children: [
                Expanded(
                child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                name,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: power ? Colors.grey[200]:Colors.black,
                ),
                ),
                ),
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: CupertinoSwitch(
                value: power, 
                onChanged: onChanged,
                ),
                )
              ],
            ),
          ],
        ),
      
      ),
    );
  }
}