// Main import native from flutter
import 'package:flutter/material.dart';

// Radar chart import
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

// Pages imports
import 'package:job_matching_app/details_timeline_page.dart';

// import for the timeline
import 'package:timeline_tile/timeline_tile.dart';

// Import for dotted border
import 'package:dotted_border/dotted_border.dart';

// Imports for the map
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


// Candidate details page
class CandidateDetailsPage extends StatefulWidget {
  const CandidateDetailsPage({super.key});

  @override
  State<CandidateDetailsPage> createState() => _CandidateDetailsPageState();
}

class _CandidateDetailsPageState extends State<CandidateDetailsPage> {

  // Variable "is dark mode triggered" 
  late bool darkMode;

  // List of ticks for the radar chart
  final List<int> ticks = [
    25,
    50,
    75,
    100,
  ];

  // List of the features' names for the radar chart
  final List<String> features = [
    "Similar \nExperiences",
    "Senority",
    "Required \nSkills",
    "Education",
    "Retention",
    "Personalized \nCriteria",
    "Industries",
  ];

  // List of the data for the radar chart
  final List<List<double>> data = [
    [100, 95, 98, 15, 75, 72, 60],
  ];

  @override
  // Main build function
  Widget build(BuildContext context) {

    // Get the size of the media query
    var mediaQuery = MediaQuery.sizeOf(context);

    // Position of the center of the map
    LatLng position = LatLng(47.239576305730104, 2.0919235518778003);

    // Check if the dark mode is triggered
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;

    // Return the scaffold
    return Scaffold(

      // Set background color of the page
      backgroundColor: Theme.of(context).colorScheme.background,

      // Allow the body to extend behind the app bar
      extendBodyBehindAppBar: true,

      // App bar
      appBar: AppBar(
        title: const Text('Candidate Details'), // Title of the app bar
        backgroundColor: Colors.transparent, // Background color of the app bar
        automaticallyImplyLeading: true,  // Automatically show the leading back arrow
        foregroundColor: Theme.of(context).colorScheme.secondary, // Color of the text in the app bar
      ),
      // Body of the page is a single scrollable column
      body: SingleChildScrollView(
        child: Column(
          children: [

            // A stack to allow the radar chart to be displayed on top of the profile picture
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [

                    // Radar chart
                    Container(

                      padding: const EdgeInsets.all(35), // Padding of the container
                      margin: const EdgeInsets.only(right: 5, left: 5, top: 5), // Margin of the container

                      // Decoration of the container
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Color of the shadow
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: const Offset(0, 3), // Offset of the shadow (x, y)
                          ),
                        ],

                        color: Theme.of(context).colorScheme.background, // Background color of the container

                        // Set all borders of the container to be colored in grey
                        border: Border.all(
                          color: Colors.grey,
                        ),

                        // Set all borders of the container to be rounded with a radius of 30
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),

                      height: mediaQuery.width, // Height of the container is equal to the width of the screen
                      alignment: Alignment.center, // Alignment of the container is centered
                      child: darkMode // Check if the dark mode is triggered
                          ? RadarChart.dark( // If dark mode is triggered, display the dark radar chart
                              // Set the parameters of the radar chart
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: true,
                            )

                          : RadarChart.light( // If dark mode is not triggered, display the light radar chart
                              // Set the parameters of the radar chart
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: true,
                            ),

                    ),
                  ],
                ),

                // Profile picture
                Positioned(
                  left: 20, // Position of the profile picture from the left of the screen
                  top: 375, // Position of the profile picture from the top of the screen

                  child: Container(
                    width: 84, // Width of the container

                    // Decoration of the container
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Shape of the container is a circle
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.black, // Color of the border is set to black
                          width: 2.0, // Width of the border is set to 2.0
                        ),
                      ),

                      // Background of the container is set to transparent
                      color: Colors.transparent,
                    ),

                    child: Transform.scale(
                      scale: 0.8, // Scale of the profile picture is set to 0.8
                      child: ClipRRect(
                        child: Image.asset("lib/assets/images/dart_logo.png"), // Image's link of the profile picture
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Name of the candidate
            Container(
              margin: const EdgeInsets.only(top: 11), // Margin of the container
              child: Text(
                "Edouard Vaillant",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary, // Color of the text
                    fontSize: 24), // Font size of the text
              ),
            ),

            // Candidate details
            Column(
              mainAxisAlignment: MainAxisAlignment.end, // Alignment of the column
              children: [
                Row(
                  children: [

                    // Location of the candidate
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.28), // Margin of the container
                      child: const Text(
                        "Habite à Vierzon",
                        style: TextStyle(color: Colors.blue, fontSize: 18), // Style of the text
                      ),
                    ),

                    // Distance of the candidate
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.25), // Margin of the container
                      child: const Text(
                        "3Km",
                        style: TextStyle(color: Colors.blue, fontSize: 18), // Style of the text
                      ),
                    ),
                  ],
                ),

                // Mission part
                Container(
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(left: 10, top: 10), // Margin of the container
                  child: const Text(
                    "Mission",
                    style: TextStyle(color: Colors.black, fontSize: 20), // Style of the text
                  ),
                ),

                // Text field for the mission
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10), // Margin of the container
                  child: TextField(

                    // Text field parameters
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.blue, fontSize: 16), // Style of the text

                    // Controller of the text field
                    controller: TextEditingController(
                        text:
                            "McDonald’s France s’engage au quotidien pour une alimentation durable et un impact plus positif"),

                    // Decoration of the text field
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Border of the text field is set to none
                      hintText: 'Entrez votre mission', // Hint text of the text field
                    ),
                  ),
                ),

                // Vision part
                Container(
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(left: 10, top: 20), // Margin of the container
                  child: const Text(
                    "Vision",
                    style: TextStyle(color: Colors.black, fontSize: 20), // Style of the text
                  ),
                ),

                // Text field for the vision
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10), // Margin of the container
                  child: TextField(

                    // Text field parameters
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.blue, fontSize: 16), 

                    // Controller of the text field
                    controller: TextEditingController(
                        text:
                            "McDonald’s souhaite être le leader mondial du fast-food en créant des expériences inoubliables au travers d'une qualité de service, une propreté et des valeurs fortes."),

                    // Decoration of the text field
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Border of the text field is set to none
                      hintText: 'Entrez votre mission', // Hint text of the text field
                    ),
                  ),
                ),

                // Values part
                Container(
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(left: 10, top: 20), // Margin of the container
                  child: const Text(
                    "Dates clés de l'entreprise",
                    style: TextStyle(color: Colors.black, fontSize: 20), // Style of the text
                  ),
                ),

                // Timeline part
                Container(
                  constraints: const BoxConstraints(maxHeight: 124), // Constraints of the container

                  // Text button for the timeline
                  child: TextButton(

                    // On pressed, navigate to the details timeline page
                    onPressed: () => Navigator.push( 
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const DetailsTimeLinePage(),
                      ),
                    ),

                    // Child of the text button
                    child: ListView(
                      scrollDirection: Axis.horizontal, // Scroll direction of the list view
                      shrinkWrap: true, // Shrink wrap of the list view
                      children: [

                        // Timeline 1st tile
                        TimelineTile(
                          axis: TimelineAxis.horizontal, // Set the axis of the timeline to horizontal
                          alignment: TimelineAlign.center, // Set the alignment of the timeline to center

                          // Set the style of the line before the timeline tile
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the line after the timeline tile
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the indicator
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),

                          // Set as the first tile of the timeline
                          isFirst: true,

                          // Set the start child of the timeline tile
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),
                          ),

                          // Set the end child of the timeline tile
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),

                            // Child of the end child
                            child: const Column(
                              children: [

                                // Icon of the column 
                                Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.blue,
                                ),

                                // Text of the column
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Timeline 2nd tile
                        TimelineTile(
                          axis: TimelineAxis.horizontal, // Set the axis of the timeline to horizontal
                          alignment: TimelineAlign.center, // Set the alignment of the timeline to center

                          // Set the style of the line before the timeline tile
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the line after the timeline tile
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the indicator
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),

                          // Set the start child of the timeline tile
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),
                          ),

                          // Set the end child of the timeline tile
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),

                            // Child of the end child
                            child: const Column(
                              children: [

                                // Icon of the column
                                Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.blue,
                                ),

                                // Text of the column
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Timeline 3rd tile
                        TimelineTile(
                          axis: TimelineAxis.horizontal, // Set the axis of the timeline to horizontal
                          alignment: TimelineAlign.center, // Set the alignment of the timeline to center

                          // Set the style of the line before the timeline tile
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the line after the timeline tile
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the indicator
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),

                          // Set the start child of the timeline tile
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),
                          ),

                          // Set the end child of the timeline tile
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),

                            // Child of the end child
                            child: const Column(
                              children: [

                                // Icon of the column
                                Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.blue,
                                ),

                                // Text of the column
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Timeline 4th tile
                        TimelineTile(
                          axis: TimelineAxis.horizontal, // Set the axis of the timeline to horizontal
                          alignment: TimelineAlign.center, // Set the alignment of the timeline to center

                          // Set the style of the line before the timeline tile
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the line after the timeline tile
                          afterLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the indicator
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),

                          // Set the start child of the timeline tile
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),
                          ),

                          // Set the end child of the timeline tile
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),

                            // Child of the end child
                            child: const Column(
                              children: [

                                // Icon of the column
                                Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.blue,
                                ),

                                // Text of the column
                                Text(
                                  "2010",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Timeline 5th tile
                        TimelineTile(
                          axis: TimelineAxis.horizontal, // Set the axis of the timeline to horizontal
                          alignment: TimelineAlign.center, // Set the alignment of the timeline to center

                          // Set the tile as the last one of the timeline
                          isLast: true,

                          // Set the style of the line before the timeline tile
                          beforeLineStyle: const LineStyle(
                            color: Colors.blue,
                            thickness: 2,
                          ),

                          // Set the style of the line after the timeline tile
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.star,
                            ),
                            width: 20,
                            color: Colors.blue,
                          ),

                          // Set the start child of the timeline tile
                          startChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),
                          ),

                          // Set the end child of the timeline tile
                          endChild: Container(
                            constraints: BoxConstraints(
                              minWidth: mediaQuery.width * 0.25,
                            ),

                            // Child of the end child
                            child: const Column(
                              children: [

                                // Icon of the column
                                Icon(
                                  Icons.keyboard_double_arrow_down,
                                  color: Colors.blue,
                                ),

                                // Text of the column
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

                // Vacant jobs part
                Container(
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(left: 10, top: 20), // Margin of the container

                  // Text of the container
                  child: const Text(
                    "Postes actuellement vacants",
                    style: TextStyle(color: Colors.black, fontSize: 20), // Style of the text
                  ),
                ),

                // Dotted border for the vacant jobs
                Container(
                  margin: EdgeInsets.only(top: mediaQuery.width * 0.03), // Margin of the container
                  width: mediaQuery.width * 0.9, // Width of the container
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left

                  // Dotted border of the container
                  child: DottedBorder(

                    // Parameters of the dotted border
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),

                    // Child of the dotted border
                    child: Container(
                      padding: const EdgeInsets.all(8), // Padding of the container
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Alignment of the row
                        children: [

                          // Name of the job
                          Text(
                            "Préparateur commandes en sous-sol",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),

                          // Percentage of compatibility between the candidate and the job
                          Text(
                            "39%",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Dotted border for the vacant jobs
                Container(
                  margin: EdgeInsets.only(top: mediaQuery.width * 0.03), // Margin of the container
                  width: mediaQuery.width * 0.9, // Width of the container
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left

                  // Dotted border of the container
                  child: DottedBorder(

                    // Parameters of the dotted border
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),

                    // Child of the dotted border
                    child: Container(
                      padding: const EdgeInsets.all(8), // Padding of the container
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Alignment of the row
                        children: [

                          // Name of the job
                          Text(
                            "Abattage de bétail",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),

                          // Percentage of compatibility between the candidate and the job
                          Text(
                            "98%",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Dotted border for the vacant jobs
                Container(
                  margin: EdgeInsets.only(top: mediaQuery.width * 0.03), // Margin of the container
                  width: mediaQuery.width * 0.9, // Width of the container
                  alignment: Alignment.bottomLeft, // Alignment of the container is set to bottom left

                  // Dotted border of the container
                  child: DottedBorder(

                    // Parameters of the dotted border
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    borderType: BorderType.values[1],
                    radius: const Radius.circular(12),

                    // Child of the dotted border
                    child: Container(
                      padding: const EdgeInsets.all(8), // Padding of the container
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Alignment of the row
                        children: [

                          // Name of the job
                          Text(
                            "Réparateur de robot karcher",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),

                          // Percentage of compatibility between the candidate and the job
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
                  margin: EdgeInsets.only(top: mediaQuery.width * 0.03),
                  alignment: Alignment.center,
                  height: mediaQuery.height * 0.3,
                  width: mediaQuery.width * 0.95,
                  child: IgnorePointer(
                    child: FlutterMap(
                      options: MapOptions(
                        interactionOptions: const InteractionOptions(
                            flags:
                                InteractiveFlag.all & ~InteractiveFlag.rotate,
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
                                turns: const AlwaysStoppedAnimation(10 / 360),
                                child: Icon(
                                  size: mediaQuery.width * 0.08,
                                  Icons.push_pin,
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
