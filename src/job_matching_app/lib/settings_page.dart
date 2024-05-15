import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
          value: isDarkMode,
          onChanged: (bool value) {
            setState(() {
              isDarkMode = !isDarkMode;
              isDarkMode==false? AdaptiveTheme.of(context).setLight(): AdaptiveTheme.of(context).setDark();
            });
          },
        ),
      ),
    );
  }
}
