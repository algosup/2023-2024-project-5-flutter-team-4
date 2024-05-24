import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:job_matching_app/connection_pages/connection_page.dart';
import 'package:job_matching_app/home_page.dart';
import 'package:job_matching_app/match_page.dart';
import 'package:job_matching_app/profile_settings_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
        (value) => SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [SystemUiOverlay.top],
        ),
      )
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool debug = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
      Future.delayed(const Duration(milliseconds: 500), () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
      });
    });
    // SharedPreferences.setMockInitialValues({}); // May be important ???????????

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
        home: !debug ? const ConnectionPage() : const RootPage(),
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
    const ProfileSettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // final style = Theme.of(context).colorScheme.onSecondary;
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: SafeArea(
        child: NavigationBar(
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
      ),
    );
  }
}
