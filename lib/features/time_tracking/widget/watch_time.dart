import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';

class WatchTime extends StatefulWidget {
  const WatchTime({super.key});
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
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: Container(
                    height: AppSizes.size250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromRGBO(71, 85, 105, 1.0),
                        width: AppSizes.size4,
                      ),
                    ),
                    child: Text(
                      WatchProvider().formattedText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: AppSizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(100, 116, 139, 0.2),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(71, 85, 105, 1.0),
                        radius: 27,
                        child: IconButton(
                          onPressed: () {
                            WatchProvider().stop();
                          },
                          icon: Icon(Icons.stop),
                          iconSize: AppSizes.size32,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(100, 116, 139, 0.2),
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(71, 85, 105, 1.0),
                        radius: 27,
                        child: IconButton(
                          onPressed: () {
                            WatchProvider().start();
                          },
                          icon: Icon(Icons.play_arrow_outlined),
                          iconSize: AppSizes.size32,
                          color: AppColors.white,
                        ),
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
