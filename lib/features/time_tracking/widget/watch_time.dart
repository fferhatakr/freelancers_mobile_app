import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';

class WatchTime extends StatefulWidget {
  @override
  State<WatchTime> createState() => _WatchTimeState();
}

class _WatchTimeState extends State<WatchTime> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListenableBuilder(
          listenable: WatchProvider(),
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff0395eb), width: 4),
                    ),
                    child: Text(
                      WatchProvider().formattedText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        WatchProvider().stop();
                      },
                      child: Icon(Icons.stop, size: 30, color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        WatchProvider().start();
                      },
                      child: Icon(
                        Icons.play_arrow_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
