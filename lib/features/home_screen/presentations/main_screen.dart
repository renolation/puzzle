import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../utils/constants.dart';
import '../../../utils/enums.dart';
import 'difficulty_screen.dart';
import 'home_screen.dart';
import 'level_screen.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 36,),
        SizedBox(
          // width: 250.0,
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Sliding Puzzler',
                textStyle:  const TextStyle(fontSize: 35),
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
            child: FlutterLogo(
          size: 230,
        )),
        const SizedBox(
          height: 32,
        ),
        DefaultTextStyle(
          style:  const TextStyle(fontSize: 35),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Tap to START'),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              ref
                  .read(homeScreenTypeProvider.notifier)
                  .update((state) => HomeScreenState.difficulty);
            },
          ),
        ),
      ],
    );
  }
}
