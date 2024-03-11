import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_api_hw1/themes/theme_provider.dart';


Widget MyTitle() {
  return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.news),
            SizedBox(width: 10),
            Text('News'),
          ],
        ),
        Row(
          children: [
            Icon(CupertinoIcons.sun_max_fill),
            DarkModeSwitch(),
            Icon(CupertinoIcons.moon_fill),
          ],
        ),
      ],
  );
}

class DarkModeSwitch extends HookConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeProvider);
    return Switch(
      value: appThemeState.themeData,
      onChanged: (enabled) {
        if (enabled) {
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}
