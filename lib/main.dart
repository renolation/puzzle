import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reno_puzzle/providers/providers.dart';
import 'package:reno_puzzle/utils/data.dart';

import 'features/home_screen/domains/levels.dart';
import 'features/play_screen/presentations/play_screen.dart';
import 'routing/app_router.dart';

const levelsBox = 'levelsBox';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  MobileAds.instance
      .updateRequestConfiguration(RequestConfiguration(
    testDeviceIds: listTestDeviceId,
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
    maxAdContentRating: 'MA',
  ));



  await Hive.initFlutter();
  Hive.registerAdapter(LevelsAdapter());
  await Hive.openBox<Levels>(levelsBox);

  runApp( const
     ProviderScope(
        overrides: [
    ],child:  MyApp(),),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.sourceCodeProTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.sourceCodePro(textStyle: textTheme.bodyText2),
        ),      ),

    );
  }
}


