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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 50),
            child: Text(
              "More Settings",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily: 'Shanti',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 38, 135),
                  Color.fromARGB(255, 215, 0, 123),
                ],
              )
            ),
        child: Column(
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
                onChanged: null,
                // onChanged: (bool value) {
                  // setState(() {
                  //   isDarkMode = !isDarkMode;
                  //   isDarkMode == false
                  //       ? AdaptiveTheme.of(context).setLight()
                  //       : AdaptiveTheme.of(context).setDark();
                  // });
                // },
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
                      return const Icon(Icons.house, color: Colors.black);
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
