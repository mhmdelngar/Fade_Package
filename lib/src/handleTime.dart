import 'dart:async';

class HandleTime {
  int? remainingDays;
  final StreamController<int?> ctrl = StreamController<int?>.broadcast();
  remainingTime(bool paid, DateTime dateTime) {
    if (!paid) {
      remainingDays = dateTime.difference(DateTime.now()).inDays + 1;
      ctrl.add(remainingDays);
    } else {
      remainingDays = null;
      ctrl.add(remainingDays);
    }
  }
}
