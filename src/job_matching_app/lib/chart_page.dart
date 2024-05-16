import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final gridColor = Colors.white;
  final titleColor = Colors.black;
  final experiencesColor = Colors.red;
  final seniorityColor = Colors.yellow;
  final skillsColor = Colors.green;
  final educationColor = Colors.cyan;
  final retentionColor = Colors.brown;
  final personalizedColor = Colors.orange;
  final industriesColor = Colors.purple;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Chart Page'),
      ),
    );
  }
}
