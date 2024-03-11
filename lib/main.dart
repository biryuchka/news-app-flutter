import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'themes/themes.dart';
import 'themes/theme_provider.dart';
import 'pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeProvider);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Api App',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: appThemeState.themeData ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(title: "HomePage",),
    );
  }
}