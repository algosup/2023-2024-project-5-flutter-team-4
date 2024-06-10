// Main imports native from flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Adaptive theme import for theme changing
import 'package:adaptive_theme/adaptive_theme.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:job_matching_app/chart_page.dart';
import 'package:job_matching_app/match/candidate_details_page.dart';
import 'package:job_matching_app/settings/candidate_profile_settings_page.dart';
import 'home/firebase_options.dart';

// Pages imports
import 'package:job_matching_app/connection_pages/connection_page.dart';
import 'package:job_matching_app/messages/messages_page.dart';
import 'package:job_matching_app/match/match_page.dart';
import 'package:job_matching_app/settings/company_profile_settings_page.dart';
import 'splash_screen.dart';

// import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';

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
      }).then((value) =>
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          )));
    });
    // SharedPreferences.setMockInitialValues({}); // May be important ???????????

    // Return the AdaptiveTheme widget
    return AdaptiveTheme(
      // Set the light and dark theme options
      light: ThemeData(
        fontFamily: 'Raleway',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
          // background: const Color.fromARGB(255, 213, 206, 195),
          background: Colors.white,
          primary: const Color.fromARGB(255, 248, 249, 251),
          secondary: const Color.fromARGB(255, 255, 255, 255),
          // secondary: const Color.fromARGB(255, 211, 169, 157),
          tertiary: const Color.fromARGB(255, 255, 255, 255),
          onBackground: const Color.fromARGB(255, 0, 0, 0),
        ),
      ), // Light Theme Options
      dark: ThemeData(
        fontFamily: 'Raleway',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 82, 103),
          background: const Color.fromARGB(255, 50, 58, 59),
          primary: const Color.fromARGB(255, 248, 249, 252),
          secondary: const Color.fromARGB(255, 243, 203, 131),
          tertiary: const Color.fromARGB(255, 255, 255, 255),
          onBackground: const Color.fromARGB(255, 255, 255, 255),
        ),
      ), // Dark Theme Options
      initial: AdaptiveThemeMode.light, // Inital theme when app starts
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adopte 1 Candidat',
        theme: theme,
        darkTheme: darkTheme,

        // Home page is the connection page if debug is false, else it is the root page
        home: const SplashScreen(),
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

  // Build function
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      if (!isCompanyView) const MatchPage() else const ChartPage(),
      if (!isCompanyView) const MessagesPage(id: 0) else const MatchPage(),
      if (!isCompanyView)
        const CompanyProfileSettingsPage()
      else
        const MessagesPage(id: 0),
      if (!isCompanyView)
        const CandidateProfileSettingsPage()
      else
        const CompanyProfileSettingsPage(),
    ];
    return Scaffold(
      // Body is the current page
      body: pages[currentPage],

      // Bottom navigation bar
      bottomNavigationBar: SafeArea(
        child: NavigationBar(
          // Set Colors
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.transparent,

          // Only show the label of the selected page
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

          // Destinations
          destinations: [
            // Home page
            NavigationDestination(
              icon: currentPage == 0
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.25, 0.5],
                        colors: [
                          Color.fromARGB(255, 169, 38, 135),
                          Color.fromARGB(255, 215, 0, 123),
                        ],
                      ).createShader(bounds),
                      child: Icon(
                        !isCompanyView
                            ? RpgAwesome.supersonic_arrow
                            : Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    )
                  : Icon(
                      !isCompanyView ? RpgAwesome.supersonic_arrow : Icons.menu,
                      size: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.black),
              label: 'Home',
            ),

            // Settings page
            NavigationDestination(
              icon: currentPage == 1
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.25, 0.5],
                        colors: [
                          Color.fromARGB(255, 169, 38, 135),
                          Color.fromARGB(255, 215, 0, 123),
                        ],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds),
                      child: Icon(
                        !isCompanyView
                            ? FontAwesome.chat
                            : RpgAwesome.supersonic_arrow,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    )
                  : Icon(
                      !isCompanyView
                          ? FontAwesome.chat
                          : RpgAwesome.supersonic_arrow,
                      size: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.black),
              label: 'Chat',
            ),

            // Match page
            NavigationDestination(
              icon: currentPage == 2
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.25, 0.5],
                        colors: [
                          Color.fromARGB(255, 169, 38, 135),
                          Color.fromARGB(255, 215, 0, 123),
                        ],
                      ).createShader(bounds),
                      child: Icon(
                        !isCompanyView
                            ? FontAwesome5.book_reader
                            : FontAwesome.chat,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    )
                  : Icon(
                      !isCompanyView
                          ? FontAwesome5.book_reader
                          : FontAwesome.chat,
                      size: MediaQuery.of(context).size.width * 0.1,
                      color: isCompanyView ? Colors.black : Colors.grey),
              label: 'Match',
              enabled: isCompanyView ? true : false,
            ),

            // Settings page
            NavigationDestination(
              icon: currentPage == 3
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.25, 0.5],
                        colors: [
                          Color.fromARGB(255, 169, 38, 135),
                          Color.fromARGB(255, 215, 0, 123),
                        ],
                      ).createShader(bounds),
                      child: Icon(
                        Octicons.person,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    )
                  : Icon(Octicons.person,
                      size: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.black),
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
