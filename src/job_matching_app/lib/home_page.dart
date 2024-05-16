import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/assets/images/flutter_logo.png'),
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
