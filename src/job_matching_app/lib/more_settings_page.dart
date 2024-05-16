import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreSettingsPage extends StatefulWidget {
  const MoreSettingsPage({super.key});

  @override
  State<MoreSettingsPage> createState() => _MoreSettingsPageState();
}

class _MoreSettingsPageState extends State<MoreSettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text("More Settings",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            )),
      ),
      body: Center(
        child: Switch(
          activeColor: Theme.of(context).colorScheme.primary,
          activeTrackColor: Theme.of(context).colorScheme.secondary,
          inactiveThumbColor: Theme.of(context).colorScheme.secondary,
          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            (Set<MaterialState> states) {
              if (isDarkMode) {
                return const Icon(Icons.nightlight);
              } else {
                return const Icon(Icons.sunny);
              }
            },
          ),
          value: isDarkMode,
          onChanged: (bool value) {
            setState(() {
              isDarkMode = !isDarkMode;
              isDarkMode == false
                  ? AdaptiveTheme.of(context).setLight()
                  : AdaptiveTheme.of(context).setDark();
            });
          },
        ),
      ),
    );
  }
}
