import 'package:confetti/confetti.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ConfettiController useConfettiController({required Duration duration}) {
  return use(_ConfettiControllerHook(duration: duration));
}

class _ConfettiControllerHook extends Hook<ConfettiController> {
  const _ConfettiControllerHook({
    required this.duration,
    List<Object?>? keys,
  }) : super(keys: keys);

  final Duration duration;

  @override
  _ConfettiControllerHookState createState() => _ConfettiControllerHookState();
}

class _ConfettiControllerHookState
    extends HookState<ConfettiController, _ConfettiControllerHook> {
  late final ConfettiController _controller =
  ConfettiController(duration: hook.duration);

  @override
  void didUpdateHook(_ConfettiControllerHook oldHook) {
    super.didUpdateHook(oldHook);

    if (hook.duration != oldHook.duration) {
      _controller.duration = hook.duration;
    }
  }

  @override
  ConfettiController build(_) => _controller;

  @override
  void dispose() => _controller.dispose();
}