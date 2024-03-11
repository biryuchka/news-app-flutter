import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_api_hw1/themes/theme_provider.dart';


class MyAppBar extends AppBar{
  MyAppBar({super.key, PreferredSizeWidget? bottom}) :super(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:[
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
        ),
        bottom: bottom,
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