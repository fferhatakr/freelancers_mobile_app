import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class WatchTime extends StatefulWidget {
  const WatchTime({super.key});

  @override
  State<WatchTime> createState() => _WatchTimeState();
}

class _WatchTimeState extends State<WatchTime> {
  late Stopwatch stopWatch;
  Timer? t;

  void start() {
    if (stopWatch.isRunning == false) {
      stopWatch.start();
    }
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void stop() {
    if (stopWatch.isRunning == true) {
      stopWatch.stop();
      t?.cancel();
    }
  }

  String returnFormattedText() {
    var milli = stopWatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  // Üst üste hata sayfa binmesini engelliyoruz.
  @override
  void dispose() {
    t?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    stopWatch = Stopwatch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
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
                  returnFormattedText(),
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
                    stop();
                  },
                  child: Icon(Icons.stop, size: 30, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    start();
                  },
                  child: Icon(
                    Icons.play_arrow_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            CupertinoButton(
              // this the cupertino button and here we perform all the reset button function
              onPressed: () {
                stopWatch.stop();
                t?.cancel();
                t = null;

                stopWatch.reset();
                setState(() {});
              },
              padding: EdgeInsets.all(0),
              child: Text(
                "Reset",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
