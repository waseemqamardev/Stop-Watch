import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer = Timer(Duration(seconds: 0), () {});
  int _hour = 00;
  int _minute = 00;
  int _seconds = 00;
  int _milliseconds = 00;

  bool _start = true;
  bool _stop = false;
  bool _continue = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  int get milliseconds => _milliseconds;
  bool get start => _start;
  bool get stop => _stop;
  bool get continuee => _continue;

  void startTimer() {
    _milliseconds = 0;
    _hour = 0;
    _minute = 0;
    _seconds = 0;
    _start = false;
    _stop = true;
    _continue = false;

    // Cancel existing timer before starting a new one
    _timer.cancel();

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _milliseconds += 1;

      if (_milliseconds == 100) {
        _milliseconds = 0;
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minute < 59) {
            _minute++;
          } else {
            _minute = 0;
            _hour++;
          }
        }
      }

      notifyListeners();
    });
  }

  void continueTimer() {
    _start = false;
    _stop = true;
    _continue = false;

    // Cancel existing timer before starting a new one
    _timer.cancel();

    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        _milliseconds += 1;

      if (_milliseconds == 100) {
        _milliseconds = 0;
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minute < 59) {
            _minute++;
          } else {
            _minute = 0;
            _hour++;
          }
        }
      }

      notifyListeners();
    });
  }


  void stopTimer() {
    if (_start == false) {
      _start = true;
      _continue = true;
      _stop = false;
      _timer.cancel();
    }
    notifyListeners();
  }


}
