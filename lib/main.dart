// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/models/task.dart';
import 'package:tood_em/pages/home_page.dart';
import 'package:tood_em/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tood_em/util/onboarding/opening_logic.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  var box = await Hive.openBox(Constant.boxName);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.lightTheme,
      title: 'TOOD\'EM',
      routes: {
        '/': (context) => entryLogic(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
