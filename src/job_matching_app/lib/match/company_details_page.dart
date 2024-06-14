import 'package:flutter/material.dart';
import 'package:job_matching_app/match/details_timeline_page.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CompanyDetailsPage extends StatefulWidget {
  const CompanyDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  late bool darkMode;
  var id;

  @override
  Widget build(BuildContext context) {
    debugPrint("CompanyDetailsPage");
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    var mediaQuery = MediaQuery.sizeOf(context);
    LatLng position = const LatLng(47.239576305730104, 2.0919235518778003);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
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
                      margin: EdgeInsets.only(top: mediaQuery.width * 0.03),
                      alignment: Alignment.center,
                      height: mediaQuery.height * 0.3,
                      width: mediaQuery.width * 0.95,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IgnorePointer(
                            child: FlutterMap(
                              options: MapOptions(
                                interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.all &
                                        ~InteractiveFlag.rotate,
                                    enableMultiFingerGestureRace: false,
                                    enableScrollWheel: false),
                                initialZoom: 15,
                                initialCenter: position,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'com.example.app',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: position,
                                      child: RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            10 / 360),
                                        child: Icon(
                                          size: mediaQuery.width * 0.08,
                                          Icons.location_on,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 5,
                  top: 235,
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
                        child: Image.asset("lib/assets/images/logo.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 11, left: 110),
              child: Text(
                "Préparateur de commande en sous-sol",
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
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).width * 0.28),
                          child: const Text(
                            "Mc Donald's Vierzon",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).width * 0.88),
                          child: const Text(
                            "3Km",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
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
                    maxLines: null,
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
                  margin: const EdgeInsets.only(left: 10, top: 20),
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
                    maxLines: null,
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
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Dates clés de l'entreprise",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 124),
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            DetailsTimeLinePage(id: id),
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
                  margin: const EdgeInsets.only(left: 10, top: 20),
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
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Environnement de travail et culture interne",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Row(
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
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Opportunités d'évolution et de carrière",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Store Manager",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Avantages",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Competitive Pay",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Health and Wellness Benefits",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Retirement and Savings Plans",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "...",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Localisation de l'entreprise",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Initiatives RSE",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Sustainable sourcing",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Packaging and Recycling",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Climate Action",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Support for Families",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Témoignages A1C",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "\"Paycheck is good\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "\"I love mc Donald's !\"",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
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
