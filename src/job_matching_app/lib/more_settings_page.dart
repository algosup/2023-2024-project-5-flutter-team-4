import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreSettingsPage extends StatefulWidget {
  const MoreSettingsPage({super.key});

  @override
  State<MoreSettingsPage> createState() => _MoreSettingsPageState();
}

class _MoreSettingsPageState extends State<MoreSettingsPage> {
  bool isDarkMode = false;
  bool isCompanyView = false;

  @override
  void initState() {
    super.initState();
    getSharedPreferences('isCompanyView').then((value) {
      setState(() {
        isCompanyView = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AdaptiveThemeMode adaptiveThemeMode = AdaptiveTheme.of(context).mode;
    isDarkMode = adaptiveThemeMode == AdaptiveThemeMode.dark ? true : false;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.secondary,
              inactiveThumbColor: Theme.of(context).colorScheme.secondary,
              value: isDarkMode,
              thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                (Set<MaterialState> states) {
                  if (isDarkMode) {
                    return const Icon(Icons.nightlight, color: Colors.black);
                  } else {
                    return const Icon(Icons.sunny, color: Colors.black);
                  }
                },
              ),
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
          Center(
            child: Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.secondary,
              inactiveThumbColor: Theme.of(context).colorScheme.secondary,
              value: isCompanyView,
              thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                (Set<MaterialState> states) {
                  if (isCompanyView) {
                    return const Icon(Icons.house, color: Color.fromARGB(255, 164, 138, 138));
                  } else {
                    return const Icon(Icons.person, color: Colors.black);
                  }
                },
              ),
              onChanged: (bool value) {
                setState(() {
                  isCompanyView = !isCompanyView;
                  if (isCompanyView) {
                    _setSharedPreferences('isCompanyView', isCompanyView);
                  } else {
                    _setSharedPreferences('isCompanyView', isCompanyView);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}



Future<bool> getSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool(key) ?? false;
  return value;
}

Future<void> _setSharedPreferences(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}