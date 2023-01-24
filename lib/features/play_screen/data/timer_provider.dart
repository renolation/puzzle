import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider.autoDispose.family<TimerStateNotifier, int, int>((ref, time) {
  return TimerStateNotifier(time);
}
);

class TimerStateNotifier extends StateNotifier<int> {
   Timer? _timer;
  TimerStateNotifier(this.time) : super(time);
  final int time;

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  void reset(){
    state = time;
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state--;
      if(state == 0){
        stop();
      }
    });

  }

  void stop() {
    print('stopeed');
    if(_timer != null) _timer!.cancel();
  }
}
