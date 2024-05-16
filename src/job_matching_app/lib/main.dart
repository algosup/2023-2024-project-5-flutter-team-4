import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:job_matching_app/home_page.dart';
import 'package:job_matching_app/match_page.dart';
import 'package:job_matching_app/profile_settings_page.dart';
import 'package:job_matching_app/user_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

Future<void> loadAllData() async {
  try {
    await Future.wait([
      loadUser(),
    ]);
    print("Data loaded successfully");
  } catch (error) {
    throw ("Error: couldn't load data from json files");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return FutureBuilder<void>(
      future: loadAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AdaptiveTheme(
            light: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 0, 0, 0),
                background: const Color.fromARGB(255, 213, 206, 195),
                primary: const Color.fromARGB(255, 248, 249, 251),
                secondary: const Color.fromARGB(255, 211, 169, 157),
                tertiary: const Color.fromARGB(255, 0, 0, 0),
              ),
            ), // Light Theme Options
            dark: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 4, 82, 103),
                background: const Color.fromARGB(255, 50, 58, 59),
                primary: const Color.fromARGB(255, 248, 249, 252),
                secondary: const Color.fromARGB(255, 243, 203, 131),
                tertiary: const Color.fromARGB(255, 255, 255, 255),
              ),
            ), // Dark Theme Options
            initial: AdaptiveThemeMode.light, // Inital theme when app starts
            builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Adaptive Theme Learn',
              theme: theme,
              darkTheme: darkTheme,
              home: const RootPage(),
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Show a loading indicator while user data is being loaded
        }
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const MatchPage(),
    const ProfileSettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // final style = Theme.of(context).colorScheme.onSecondary;
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Match',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
