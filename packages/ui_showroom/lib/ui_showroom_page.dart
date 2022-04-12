library ui_showroom;

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_showroom/theme/theme_model.dart';
import 'package:ui_showroom/ui_pages/ui_pages_export.dart';

class UIShowRoomApp extends StatelessWidget {
  const UIShowRoomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      builder: (context, _) {
        final themeModel = context.watch<ThemeModel>();
        return MaterialApp(
          theme: themeModel.getThemeData,
          initialRoute: '/',
          routes: {
            UIconPage.routeName: (context) => const UIconPage(),
            UColorsPage.routeName: (context) => const UColorsPage(),
          },
          home: const UIShowRoomPage(),
        );
      },
    );
  }
}

class UIShowRoomPage extends StatefulWidget {
  const UIShowRoomPage({Key? key}) : super(key: key);

  @override
  State<UIShowRoomPage> createState() => _UIShowRoomPageState();
}

class _UIShowRoomPageState extends State<UIShowRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ThemeDropdownButton(),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            WidgetPageButton(
              widgetName: 'UIcon',
            ),
            WidgetPageButton(
              widgetName: 'UColors',
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeDropdownButton extends StatelessWidget {
  const ThemeDropdownButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeModel>();

    return DropdownButton(
      items: const [
        DropdownMenuItem(
          child: Text('light'),
          value: 'light',
        ),
        DropdownMenuItem(
          child: Text('dark'),
          value: 'dark',
        ),
        DropdownMenuItem(
          child: Text('TBD'),
          value: 'tbd',
        ),
      ],
      value: themeModel.getThemeName,
      onChanged: (value) {
        if (value is String) {
          final _themeModel = context.read<ThemeModel>();
          _themeModel.setTheme(value);
        } else {
          log('Error(ThemeDropdownButton):value is not a String');
        }
      },
    );
  }
}

class WidgetPageButton extends StatelessWidget {
  const WidgetPageButton({Key? key, required this.widgetName})
      : super(key: key);

  final String widgetName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/$widgetName');
      },
      child: Text(widgetName),
    );
  }
}
