import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:plantapp_case/core/theme/app_theme.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'App Light Theme',
              data: AppTheme.lightTheme,
            ),
            WidgetbookTheme(
              name: 'App Dark Theme', 
              data: AppTheme.darkTheme,
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
          ],
        ),
        TextScaleAddon(
          min: 1.0,
          max: 1.5,
        ),
        LocalizationAddon(
          locales: [
            const Locale('en'),
            const Locale('tr'),
          ],
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
        ),
      ],
      appBuilder: (context, child) {
        return MaterialApp(
          home: child,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}