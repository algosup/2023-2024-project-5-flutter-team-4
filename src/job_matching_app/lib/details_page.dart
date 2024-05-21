import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late bool darkMode;

  final List<int> ticks = [
    25,
    50,
    75,
    100,
  ];

  final List<String> features = [
    "Similar \nExperiences",
    "Senority",
    "Required \nSkills",
    "Education",
    "Retention",
    "Personalized \nCriteria",
    "Industries",
  ];

  final List<List<double>> data = [
    [100, 95, 98, 15, 75, 72, 60],
  ];

  @override
  Widget build(BuildContext context) {
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Theme.of(context).colorScheme.background,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      height: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: darkMode
                          ? RadarChart.dark(
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: true,
                            )
                          : RadarChart.light(
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: true,
                            ),
                    ),
                  ],
                ),
                Positioned(
                  left: 20,
                  top: 375,
                  child: Container(
                    width: 84,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Transform.scale(
                      scale: 0.8,
                      child: ClipRRect(
                        child: Image.asset("lib/assets/images/dart_logo.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 11),
              child: Text(
                "Edouard Vaillant",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 24),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.28),
                      child: const Text(
                        "Habite à Vierzon",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.25),
                      child: const Text(
                        "3Km",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text("Mission",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: const TextStyle(color: Colors.blue, fontSize: 16),
                    controller: TextEditingController(
                        text:
                            "McDonald’s France s’engage au quotidien pour une alimentation durable et un impact plus positif"),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entrez votre mission',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
