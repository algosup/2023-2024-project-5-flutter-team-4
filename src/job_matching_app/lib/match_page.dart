import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import 'package:job_matching_app/details_page.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  late bool darkMode;

  @override
  Widget build(BuildContext context) {
    final List<int> ticks = [
      0,
      10,
      20,
      30,
    ];

    final List<String> features = [
      "AA",
      "BB",
      "CC",
      "DD",
      "EE",
      "FF",
      "GG",
      "HH",
    ];

    final List<List<double>> data1 = [
      [10.0, 20, 28, 5, 16, 15, 17, 6],
    ];

    final List<List<double>> data2 = [
      [15, 25, 20, 10, 15, 10, 5, 10],
    ];

    final List<List<double>> data3 = [
      [20, 10, 15, 25, 10, 5, 20, 15],
    ];

    bool useSides = true;

    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    List<Container> cards = [
      Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.primary,
        child: darkMode
            ? RadarChart.dark(
                ticks: ticks,
                features: features,
                data: data1,
                reverseAxis: true,
                useSides: useSides,
              )
            : RadarChart.light(
                ticks: ticks,
                features: features,
                data: data1,
                reverseAxis: true,
                useSides: useSides,
              ),
      ),
      Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.tertiary,
        child: darkMode
            ? RadarChart.dark(
                ticks: ticks,
                features: features,
                data: data2,
                reverseAxis: true,
                useSides: useSides,
              )
            : RadarChart.light(
                ticks: ticks,
                features: features,
                data: data2,
                reverseAxis: true,
                useSides: useSides,
              ),
      ),
      Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.primary,
        child: darkMode
            ? RadarChart.dark(
                ticks: ticks,
                features: features,
                data: data3,
                reverseAxis: true,
                useSides: useSides,
              )
            : RadarChart.light(
                ticks: ticks,
                features: features,
                data: data3,
                reverseAxis: true,
                useSides: useSides,
              ),
      )
    ];
    return Scaffold(
        body: CardSwiper(
          cardsCount: cards.length,
          allowedSwipeDirection: const AllowedSwipeDirection.only(
            left: true,
            up: false,
            right: true,
            down: false,
          ),
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              cards[index],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const DetailsPage(),
              ),
            );
          },
          child: const Icon(Icons.zoom_out_map_rounded, color: Colors.black),
        ));
  }
}
