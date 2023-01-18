import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider.autoDispose<TimerStateNotifier, int>((ref) {
  return TimerStateNotifier();
}
);

class TimerStateNotifier extends StateNotifier<int> {
  late Timer _timer;
  TimerStateNotifier() : super(0);

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state++;
    });
  }

  void stop() {
    print('stopeed');
    _timer.cancel();
    state = 0;
  }
}
