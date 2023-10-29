import 'dart:async';

import 'package:get/get.dart';

class OtpTimerController extends GetxController {
  Timer? _timer;
  int remainingSeconds = 1;
  final time = '0'.obs;

  startTimer() => _startTimer(120);

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;

    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int seconds = (remainingSeconds - 1);
        time.value = seconds.toString();
        remainingSeconds--;
      }
    });
  }
}
