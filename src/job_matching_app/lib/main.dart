import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:job_matching_app/home_page.dart';
import 'package:job_matching_app/match_page.dart';
import 'package:job_matching_app/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});

    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 82, 103),
          background: const Color.fromARGB(255, 7, 154, 180),
          primary: const Color.fromARGB(255, 164, 71, 0),
          secondary: const Color.fromARGB(255, 50, 13, 160),
        ),
      ), // Light Theme Options
      dark: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 82, 103),
          background: const Color.fromARGB(255, 50, 58, 59),
          primary: const Color.fromARGB(255, 188, 92, 148),
          secondary: const Color.fromARGB(255, 219, 205, 9),
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
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
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
