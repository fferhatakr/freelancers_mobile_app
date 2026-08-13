import 'package:freelancer_tracking_system/providers/tasks.dart';

class AppData {
  static int get projectCount => TaskProvider().value.length;
}
