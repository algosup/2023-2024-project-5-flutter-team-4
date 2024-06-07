import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_matching_app/connection_pages/connection_page.dart';
import 'package:job_matching_app/main.dart';


// Debug variable
const bool DEBUG = true;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        Timer(
            const Duration(seconds: 2),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => !DEBUG ? const ConnectionPage() : const RootPage())));
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/Splash.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}