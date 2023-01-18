import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reno_puzzle/providers/providers.dart';

import 'features/home_screen/domains/levels.dart';
import 'features/play_screen/presentations/play_screen.dart';
import 'routing/app_router.dart';

getIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([LevelsSchema], directory: dir.path);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await getIsar();
  runApp(
     ProviderScope(
        overrides: [
      isarProvider.overrideWithValue(isar),
    ],child: const MyApp(),),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}


