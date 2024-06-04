

// Main imports native from flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Adaptive theme import for theme changing
import 'package:adaptive_theme/adaptive_theme.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'home/firebase_options.dart';

// Pages imports
import 'package:job_matching_app/connection_pages/connection_page.dart';
import 'package:job_matching_app/home/home_page.dart';
import 'package:job_matching_app/match/match_page.dart';
import 'package:job_matching_app/settings/profile_settings_page.dart';

// Debug variable
const bool DEBUG = true;

// Main function
Future<void> main() async {

  // Wait for the system to be initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set the orientation to portrait and hide the status bar
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    ),
  );

  // Initialize Firebase with the option of the current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());
}

// Main app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  // Main build function
  Widget build(BuildContext context) {

    // Set the system UI mode to manual and hide the status bar after 500ms
    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
      Future.delayed(const Duration(milliseconds: 500), () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
      });
    });
    // SharedPreferences.setMockInitialValues({}); // May be important ???????????

    // Return the AdaptiveTheme widget
    return AdaptiveTheme(

      // Set the light and dark theme options
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
        title: 'Adopte 1 Candidat',
        theme: theme,
        darkTheme: darkTheme,

        // Home page is the connection page if debug is false, else it is the root page
        home: !DEBUG ? const ConnectionPage() : const RootPage(),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}



bool isCompanyView = false;



class _RootPageState extends State<RootPage> {

  
@override
  void initState() {
    super.initState();
    getSharedPreferences('isCompanyView').then((value) {
      isCompanyView = value;
    }).then((value) => setState(() {}));
  }


  // Variables
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const MatchPage(),
    const ProfileSettingsPage(),
  ];

  // Build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Body is the current page
      body: pages[currentPage],

      // Bottom navigation bar
      bottomNavigationBar: SafeArea(
        child: NavigationBar(

          // Set Colors
          backgroundColor: Theme.of(context).colorScheme.primary,
          indicatorColor: Theme.of(context).colorScheme.secondary,

          // Only show the label of the selected page
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,

          // Destinations
          destinations: [

            // Home page
            NavigationDestination(
              icon: currentPage == 0
                  ? Icon(Icons.home, size: MediaQuery.of(context).size.width * 0.075)
                  : Icon(Icons.home, size: MediaQuery.of(context).size.width * 0.1),
              label: 'Home',
            ),

            // Match page
            NavigationDestination(
              icon: currentPage == 1
                  ? Icon(Icons.people, size: MediaQuery.of(context).size.width * 0.075)
                  : Icon(Icons.people, size: MediaQuery.of(context).size.width * 0.1),
              label: 'Match',
            ),

            // Settings page
            NavigationDestination(
              icon: currentPage == 2
                  ? Icon(Icons.settings, size: MediaQuery.of(context).size.width * 0.075)
                  : Icon(Icons.settings, size: MediaQuery.of(context).size.width * 0.1),
              label: 'Settings',
            ),
          ],

          // Change the current page when a destination is selected
          onDestinationSelected: (int index) {

            // Set the current page to the index
            setState(() {
              currentPage = index;
            });
          },

          // Set the selected index to the current page
          selectedIndex: currentPage,
        ),
      ),
    );
  }
}
