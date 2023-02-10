import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../utils/enums.dart';

class DifficultyScreen extends HookConsumerWidget {
  const DifficultyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 32,),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.easy.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: SvgPicture.asset(
                      'assets/icons/easy.svg',
                      semanticsLabel: 'Acme Logo',
                      fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.medium.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: SvgPicture.asset(
                      'assets/icons/normal.svg',
                      semanticsLabel: 'Acme Logo'
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.hard.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: SvgPicture.asset(
                      'assets/icons/hard.svg',
                      semanticsLabel: 'Acme Logo'
                  ),
                ),
              ),
              const SizedBox(height: 32,),
            ],
          ),
        ),
      ],
    );
  }
}
