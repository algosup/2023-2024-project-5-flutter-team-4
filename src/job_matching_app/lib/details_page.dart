import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:job_matching_app/details_timeline_page.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:dotted_border/dotted_border.dart';

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
                  child: const Text(
                    "Mission",
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
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Vision",
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
                            "McDonald’s souhaite être le leader mondial du fast-food en créant des expériences inoubliables au travers d'une qualité de service, une propreté et des valeurs fortes."),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entrez votre mission',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Dates clés de l'entreprise",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 120),
                  child: TapRegion(
                    onTapInside: (event) => 
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const DetailsTimeLinePage(),
                        ),
                      ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),
                          isFirst: true,
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.drag_indicator_sharp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.drag_indicator_sharp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.drag_indicator_sharp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.drag_indicator_sharp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isLast: true,
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                          ),
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.25,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.drag_indicator_sharp,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Postes actuellement vacants",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03),
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Préparateur commandes en sous-sol",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            "39%",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03),
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Abattage de bétail",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            "98%",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03),
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Réparateur de robot karcher",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            "8%",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Environnement de travail et culture interne",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Inclusive and Diverse Workplace",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "12 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Employee Development and Growth",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "9 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Team-Oriented Atmosphere",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "8 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Customer-Centric Approach",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "7 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Recognition and Rewards",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "3 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Flexibility and Work-Life Balance",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    Text(
                      "1 vote(s)",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Opportunités d'évolution et de carrière",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Avantages",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Localisation de l'entreprise",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Initiatives RSE",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Sustainable sourcing",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Packaging and Recycling",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Climate Action",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Support for Families",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Témoignages A1C",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "\"Paycheck is good\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Rate this company",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.white),
                    Icon(Icons.star, color: Colors.white),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
