import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider.autoDispose<TimerStateNotifier, int>((ref) => TimerStateNotifier());

class TimerStateNotifier extends StateNotifier<int> {
  late Timer _timer;
  TimerStateNotifier() : super(0);

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state++;
    });
  }

  void stop() {
    _timer.cancel();
    state = 0;
  }
}
