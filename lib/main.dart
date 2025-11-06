import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/src/home/slider_drawer_scaffold.dart';
import 'package:twitter_clone/src/home/dummy_home_body.dart';
import 'package:twitter_clone/src/home/slider_drawer_app_bar.dart';
import 'package:twitter_clone/src/home/slider_drawer_menu.dart';
import 'package:twitter_clone/src/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const color = Color.fromARGB(255, 0, 172, 238);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ref.watch(customThemeModeProvider),
      home: const SliderDrawerScaffold(
        appBarOption: SliderDrawerAppBarOption(
          title: Expanded(
            child: Text(
              'ホーム',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        drawer: SliderDrawerMenu.ratio(ratio: 1 / 2),
        body: DummyHomeBody(),
      ),
    );
  }
}
