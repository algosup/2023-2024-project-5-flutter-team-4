import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  // ignore: override_on_non_overriding_member
  late bool darkMode;
  bool useSides = true; // true = polygon, false = circle
  double numberOfFeatures = 8.0;

  @override
  Widget build(BuildContext context) {
    darkMode =
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark ? true : false;
    const ticks = [7, 14, 21, 28, 35]; // Graduation of the axis
    var features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"]; // labels
    var data = [
      [10.0, 20, 28, 5, 16, 15, 17, 6], // data 1
      // [15, 25, 20, 10, 15, 10, 5, 10], // data 2
      // [20, 10, 15, 25, 10, 5, 20, 15], // data 3
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar Chart Example'),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  useSides
                      ? Text(
                          'Polygon border',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        )
                      : Text(
                          'Circular border',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                  Switch(
                    inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                    activeTrackColor: Theme.of(context).colorScheme.secondary,
                    inactiveTrackColor: Theme.of(context).colorScheme.primary,
                    trackOutlineColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                      return Colors.transparent;
                    }),
                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                      (Set<MaterialState> states) {
                        if (useSides) {
                          return const Icon(Icons.hexagon_outlined,
                              color: Colors.black);
                        } else {
                          return const Icon(Icons.circle_outlined,
                              color: Colors.black);
                        }
                      },
                    ),
                    value: useSides,
                    onChanged: (value) {
                      setState(() {
                        useSides = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: darkMode
                  ? RadarChart.dark(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                      useSides: useSides,
                    )
                  : RadarChart.light(
                      ticks: ticks,
                      features: features,
                      data: data,
                      reverseAxis: true,
                      useSides: useSides,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
