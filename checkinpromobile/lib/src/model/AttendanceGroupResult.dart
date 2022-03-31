
import 'AttendanceGroup.dart';

class AttendanceGroupResult {
  List<AttendanceGroup> logGroupList = List();
  int totalLate = 0;
  int totalNotEnough = 0;
  int totalNotCheckout = 0;
  double totalWorkingTime = 0;
}