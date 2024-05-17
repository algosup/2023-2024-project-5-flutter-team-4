import 'package:flutter/material.dart';
import 'package:job_matching_app/chart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ChartPage(title: 'My Radar Chart'),
                  ),
                );
              },
              child: const Icon(Icons.bar_chart_rounded, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
