import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    Firebase.initializeApp();
    var db = FirebaseFirestore.instance;
    const ticks = [7, 14, 21, 28, 35]; // Graduation of the axis
    var features = ["AA", "BB", "CC", "DD", "EE", "FF", "GG", "HH"]; // labels
    var graph = [
      [0, 0, 0, 0, 0, 0, 0, 0],
    ];
    final docRef = db.collection("Users").doc("0");
    docRef.snapshots().listen(
      (event) {
        debugPrint("data: ${event.data()}");
        for (int i = 0; i < 8; i++){
          graph[0][i] = event.data()!['Graph'][i];
        }
      },
      onError: (error) => debugPrint("Listen failed: $error"),
    );

    darkMode =
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark ? true : false;

    features = features.sublist(0, numberOfFeatures.floor());
    graph = graph
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
                      data: graph,
                      reverseAxis: false,
                      useSides: useSides,
                    )
                  : RadarChart.light(
                      ticks: ticks,
                      features: features,
                      data: graph,
                      reverseAxis: false,
                      useSides: useSides,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}