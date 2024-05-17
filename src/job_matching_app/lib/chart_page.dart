import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';
import 'dart:math';



class ChartPage extends StatefulWidget {

  const ChartPage({super.key, required this.title});
  final String title;


  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  // final gridColor = Colors.white;
  // final titleColor = Colors.black;
  // final experiencesColor = Colors.red;
  // final seniorityColor = Colors.yellow;
  // final skillsColor = Colors.green;
  // final educationColor = Colors.cyan;
  // final retentionColor = Colors.brown;
  // final personalizedColor = Colors.orange;
  // final industriesColor = Colors.purple;

  // @override
  // Widget build(BuildContext context) {

  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: true,
  //       title: const Text('Chart Page'),
  //     ),
  //   );
  // }
  
  int _counter = 7;
  List<double> values1 = [0.4, 0.8, 0.65, 0.8, 0.65, 0.8, 0.65];
  List<String> titles = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  late List<PreferredSizeWidget> vertices2;
  late PreferredSizeWidget _vertex;

  @override
  void initState() {
    super.initState();
    const double radius = 3;
    _vertex = const PreferredSize(
      preferredSize: Size.square(2 * radius),
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: radius,
      ),
    );

    vertices2 = [_vertex, _vertex, _vertex, _vertex, _vertex, _vertex, _vertex];
  }

  void _incrementCounter() {
    final random = Random.secure();
    setState(() {
      _counter++;
      values1.add(random.nextDouble());
      vertices2.add(_vertex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadarChart(
              length: _counter,
              radius: 150,
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderStroke: 2,
              borderColor: Theme.of(context).colorScheme.secondary,
              radialStroke: 2,
              radialColor: Theme.of(context).colorScheme.tertiary,
              radars: [
                RadarTile(
                  values: values1,
                  borderStroke: 0,
                  borderColor: Colors.black,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  vertices: vertices2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
