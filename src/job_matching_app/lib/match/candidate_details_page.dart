// Main import native from flutter
import 'package:flutter/material.dart';

// Radar chart import
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

// Pages imports
import 'package:job_matching_app/match/details_timeline_page.dart';

// import for the timeline
import 'package:timeline_tile/timeline_tile.dart';

// Import for dotted border
import 'package:dotted_border/dotted_border.dart';

// Imports for the map
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Firebase imports
import 'package:cloud_firestore/cloud_firestore.dart';

// More Imports
import 'package:marquee/marquee.dart';

// Candidate details page
class CandidateDetailsPage extends StatefulWidget {
  const CandidateDetailsPage({super.key, required this.id});

  final int id;

  @override
  State<CandidateDetailsPage> createState() =>
      _CandidateDetailsPageState(id: id);
}

class _CandidateDetailsPageState extends State<CandidateDetailsPage> {
  var id;

  _CandidateDetailsPageState({required this.id});

  List<List<int>> data = [
    [],
  ];

  String name = ""; // Name of the candidate
  String location = ""; // Location of the candidate
  String job = ""; // Job of the candidate
  String descr = ""; // Description of the candidate

  // Dates for the timeline
  List<int> dates = [];
  List<String> datesDescription = [];

  List<String> previousJobs = [];
  List<String> softSkills = [];

  List<String> books = [];
  List<String> movies = [];

  List<String> certifs = [];

  List<String> hobbies = [];

  List<String> testimonies = [];

  int rating = -1;

  @override
  void initState() {
    super.initState();

    var db = FirebaseFirestore.instance;

    db.collection('Users').get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == id && result.data()["hasGraph"] == true) {
            name = result.data()["Name"]; // Get the name of the candidate
            location =
                result.data()["Location"]; // Get the location of the candidate
            job = result.data()["Job"]; // Get the job of the candidate

            if (result.data()["Description"] != null) {
              descr = result.data()[
                  "Description"]; // Get the description of the candidate
            } else {
              descr = "";
            }

            // Get the dates for the timeline and the description of the dates
            if (result.data()["Dates"] != null) {
              dates = result.data()["Dates"].cast<int>();
              datesDescription =
                  result.data()["DatesDescription"].cast<String>();
            } else {
              dates = [];
              datesDescription = [];
            }

            if (result.data()["PreviousJobs"] != null) {
              previousJobs = result.data()["PreviousJobs"].cast<String>();
            } else {
              previousJobs = [];
            }

            if (result.data()["SoftSkills"] != null) {
              softSkills = result.data()["SoftSkills"].cast<String>();
            } else {
              softSkills = [];
            }

            if (result.data()["Books"] != null) {
              books = result.data()["Books"].cast<String>();
            } else {
              books = [];
            }

            if (result.data()["Movies"] != null) {
              movies = result.data()["Movies"].cast<String>();
            } else {
              movies = [];
            }

            if (result.data()["Certifications"] != null) {
              certifs = result.data()["Certifications"].cast<String>();
            } else {
              certifs = [];
            }

            if (result.data()["Hobbies"] != null) {
              hobbies = result.data()["Hobbies"].cast<String>();
            } else {
              hobbies = [];
            }

            if (result.data()["Testimonies"] != null) {
              testimonies = result
                  .data()["Testimonies"]
                  .cast<String>(); // Get the testimonies of the candidate
            } else {
              testimonies = [];
            }

            if (result.data()["Rating"] != null) {
              rating =
                  result.data()["Rating"]; // Get the rating of the candidate
            } else {
              rating = -1;
            }

            if (result.data()["Graph"] != null) {
              // Get the data for the radar chart
              data = [result.data()["Graph"].cast<int>()];
            } else {
              data = [
                [0, 0, 0, 0, 0, 0, 0],
              ];
            }
            break;
          }
        }
      },
    ).then(
      (value) => setState(() {}),
    );
  }

  // Variable "is dark mode triggered"
  late bool darkMode;

  // List of ticks for the radar chart
  final List<int> ticks = [
    10,
    20,
    30,
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

  @override
  // Main build function
  Widget build(BuildContext context) {
    var tP = TextPainter(
        text: TextSpan(
          text: "Habite à $location",
          style: const TextStyle(fontSize: 18),
        ),
        textDirection: TextDirection.ltr);
    tP.layout();

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
        backgroundColor: Colors.transparent, // Background color of the app bar
        automaticallyImplyLeading:
            true, // Automatically show the leading back arrow
        foregroundColor: Theme.of(context)
            .colorScheme
            .secondary, // Color of the text in the app bar
        surfaceTintColor: Colors
            .transparent, // Set the background of the app bar to be transparent when scrolled
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
                      padding:
                          const EdgeInsets.all(35), // Padding of the container
                      margin: const EdgeInsets.only(
                          right: 5, left: 5, top: 5), // Margin of the container

                      // Decoration of the container
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Color of the shadow
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 7, // Blur radius of the shadow
                            offset: const Offset(
                                0, 3), // Offset of the shadow (x, y)
                          ),
                        ],

                        color: Theme.of(context)
                            .colorScheme
                            .background, // Background color of the container

                        // Set all borders of the container to be colored in grey
                        border: Border.all(
                          color: Colors.grey,
                        ),

                        // Set all borders of the container to be rounded with a radius of 30
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),

                      height: mediaQuery
                          .width, // Height of the container is equal to the width of the screen
                      alignment: Alignment
                          .center, // Alignment of the container is centered
                      child: darkMode // Check if the dark mode is triggered
                          ? RadarChart.dark(
                              // If dark mode is triggered, display the dark radar chart
                              // Set the parameters of the radar chart
                              ticks: ticks,
                              features: features,
                              data: data,
                              useSides: true,
                            )
                          : RadarChart.light(
                              // If dark mode is not triggered, display the light radar chart
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
                  left:
                      20, // Position of the profile picture from the left of the screen
                  top:
                      375, // Position of the profile picture from the top of the screen

                  child: Container(
                    width: 84, // Width of the container

                    // Decoration of the container
                    decoration: const BoxDecoration(
                      shape:
                          BoxShape.circle, // Shape of the container is a circle
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors
                              .black, // Color of the border is set to black
                          width: 2.0, // Width of the border is set to 2.0
                        ),
                      ),

                      // Background of the container is set to transparent
                      color: Colors.transparent,
                    ),

                    child: Transform.scale(
                      scale: 0.8, // Scale of the profile picture is set to 0.8
                      child: ClipRRect(
                        child: Image.asset(
                            "lib/assets/images/dart_logo.png"), // Image's link of the profile picture
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
                name,
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .tertiary, // Color of the text
                    fontFamily: 'Shanti',
                    fontWeight: FontWeight.bold,
                    fontSize: 24), // Font size of the text
              ),
            ),

            // Candidate details
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Alignment of the column
              children: [
                Row(
                  children: [
                    // Location of the candidate
                    Container(
                      width: mediaQuery.width *
                          0.5, // Width of the container is set to 50% of the screen
                      height: 30,
                      margin: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width *
                              0.28), // Margin of the container
                      child: tP.width > mediaQuery.width * 0.5
                          ? Marquee(
                              // textAlign: TextAlign.start,
                              text: location.isNotEmpty
                                  ? "Habite à $location"
                                  : "Localisation non renseignée",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18), // Style of the text
                              blankSpace: 50.0, // Blank space of the text
                              velocity: 50.0 // Velocity of the text
                              )
                          : Text(
                              textAlign: TextAlign.start,
                              location.isNotEmpty
                                  ? "Habite à $location"
                                  : "Localisation non renseignée",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18), // Style of the text
                            ),
                    ),

                    // Distance of the candidate
                    Container(
                      width: mediaQuery.width *
                          0.22, // Width of the container is set to 20% of the screen
                      child: const Text(
                        textAlign: TextAlign.end,
                        "3Km",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18), // Style of the text
                      ),
                    ),
                  ],
                ),

                // ================= CURRENT JOB OF THE CANDIDATE =================

                // Job part
                Container(
                  alignment: Alignment
                      .bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(
                      left: 10, top: 10), // Margin of the container
                  child: const Text(
                    "Profession actuelle",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Style of the text
                  ),
                ),

                // Text field for the mission
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10), // Margin of the container
                  child: TextField(
                    // Text field parameters
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                        color: Colors.blue, fontSize: 16), // Style of the text

                    // Controller of the text field
                    controller: TextEditingController(
                        text: job.isNotEmpty
                            ? job
                            : "Non renseigné"), // Controller of the text field (current

                    // Decoration of the text field
                    decoration: const InputDecoration(
                      border: InputBorder
                          .none, // Border of the text field is set to none
                      hintText:
                          'Cet utilisateur n\'a pas encore indiqué sa profession actuelle.', // Hint text of the text field
                    ),
                  ),
                ),

                // ================= DESCRIPTION OF THE CANDIDATE =================

                // Vision part
                Container(
                  alignment: Alignment
                      .bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(
                      left: 10, top: 20), // Margin of the container
                  child: const Text(
                    "Description du candidat",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Style of the text
                  ),
                ),

                // Text field for the vision
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10), // Margin of the container
                  child: TextField(
                    // Text field parameters
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.blue, fontSize: 16),

                    // Controller of the text field
                    controller: TextEditingController(
                        text: descr.isNotEmpty ? descr : "Non renseignée"),

                    // Decoration of the text field
                    decoration: const InputDecoration(
                      border: InputBorder
                          .none, // Border of the text field is set to none
                      hintText:
                          'Ce candidat n\'a pas encore ajouté de description à son profil.', // Hint text of the text field
                    ),
                  ),
                ),

                // Values part
                Container(
                  alignment: Alignment
                      .bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(
                      left: 10, top: 20), // Margin of the container
                  child: const Text(
                    "Dates clés du candidat",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Style of the text
                  ),
                ),

                // ================= TIMELINE DEFINITION =================

                // Timeline part
                Container(
                  constraints: const BoxConstraints(
                      maxHeight: 124), // Constraints of the container

                  // Text button for the timeline
                  child: TextButton(
                    // On pressed, navigate to the details timeline page
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            DetailsTimeLinePage(id: id),
                      ),
                    ),

                    // Child of the text button
                    child: ListView(
                      scrollDirection:
                          Axis.horizontal, // Scroll direction of the list view
                      shrinkWrap: true, // Shrink wrap of the list view
                      children: [
                        if (dates.isNotEmpty)
                          for (int i = 0; i < dates.length; i++)
                            // Timeline 1st tile
                            TimelineTile(
                              axis: TimelineAxis
                                  .horizontal, // Set the axis of the timeline to horizontal
                              alignment: TimelineAlign
                                  .center, // Set the alignment of the timeline to center

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
                                  iconData: Icons.circle_sharp,
                                ),
                                width: 20,
                                color: Colors.blue,
                              ),

                              // Set as the first tile of the timeline
                              isFirst: i == 0 ? true : false,
                              isLast: i == dates.length - 1 ? true : false,

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
                                child: Column(
                                  children: [
                                    // Icon of the column
                                    const Icon(
                                      Icons.keyboard_double_arrow_down,
                                      color: Colors.blue,
                                    ),

                                    // Text of the column
                                    Text(
                                      dates[i].toString(),
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        else
                          const Text("Aucune date n'a encore été ajoutée."),
                      ],
                    ),
                  ),
                ),

                // ================= JOB EXPERIENCES =================

                // Vacant jobs part
                Container(
                  alignment: Alignment
                      .bottomLeft, // Alignment of the container is set to bottom left
                  margin: const EdgeInsets.only(
                      left: 10, top: 20), // Margin of the container

                  // Text of the container
                  child: const Text(
                    "Expériences professionnelles similaires",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Style of the text
                  ),
                ),

                if (previousJobs.isNotEmpty)
                  for (int i = 0; i < previousJobs.length; i++)
                    // Dotted border for the vacant jobs
                    Container(
                      margin: EdgeInsets.only(
                          top: mediaQuery.width *
                              0.03), // Margin of the container
                      width: mediaQuery.width * 0.9, // Width of the container
                      alignment: Alignment
                          .bottomLeft, // Alignment of the container is set to bottom left

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
                          padding: const EdgeInsets.all(
                              8), // Padding of the container
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceAround, // Alignment of the row
                            children: [
                              // Name of the job
                              Text(
                                previousJobs[i],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),

                              // Percentage of compatibility between the candidate and the job
                              const Text(
                                "98%",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                else
                  const Text(
                      "Aucune expérience professionnelle n'a encore été ajoutée."),

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Livres et films préférés",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 20),
                          child: const Text(
                            "Livres",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        if (books.isNotEmpty)
                          for (int i = 0; i < books.length; i++)
                            Container(
                              width: mediaQuery.width * 0.4,
                              margin: EdgeInsets.only(
                                  left: mediaQuery.width * 0.05, top: 20),
                              child: Text(
                                books[i],
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 15),
                              ),
                            )
                        else
                          Container(
                            width: mediaQuery.width * 0.4,
                            margin: EdgeInsets.only(
                                left: mediaQuery.width * 0.025,
                                top: 20,
                                right: mediaQuery.width * 0.025),
                            child: const Text(
                              textAlign: TextAlign.center,
                              "Aucun livre n'a encore été ajouté.",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: mediaQuery.width * 0.4,
                          margin: EdgeInsets.only(
                              left: mediaQuery.width * 0.025, top: 20),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Films",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        if (movies.isNotEmpty)
                          for (int i = 0; i < movies.length; i++)
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 20),
                              child: Text(
                                movies[i],
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 15),
                              ),
                            )
                        else
                          Container(
                            width: mediaQuery.width * 0.4,
                            margin: EdgeInsets.only(
                                left: mediaQuery.width * 0.05,
                                top: 20,
                                right: mediaQuery.width * 0.025),
                            child: const Text(
                              textAlign: TextAlign.center,
                              "Aucun film n'a encore été ajouté.",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

                // ================= CERTIFICATIONS =================

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Certifications Obtenues",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

                if (certifs.isNotEmpty)
                  for (int i = 0; i < certifs.length; i++)
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 30, top: 5),
                      child: Text(
                        certifs[i],
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                else
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(left: 30, top: 5),
                    child: const Text(
                      "Aucune certification n'a encore été ajoutée.",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),

                // ================= TBD =================

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Avantages",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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

                // ================= MAP =================

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Localisation de l'entreprise",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
                                turns: const AlwaysStoppedAnimation(0 / 360),
                                child: Icon(
                                  size: mediaQuery.width * 0.08,
                                  Icons.location_on_sharp,
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
                  child: Text(
                    "Hobbies de $name",
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

                if (hobbies.isNotEmpty)
                  for (int i = 0; i < hobbies.length; i++)
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 30, top: 5),
                      child: Text(
                        hobbies[i],
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                else
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(left: 30, top: 5),
                    child: const Text(
                      "Aucun hobby n'a encore été ajouté.",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),

                // ================= TESTIMONIES FROM COMPANIES =================

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: const Text(
                    "Témoignages D'entreprises",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

                if (testimonies.isNotEmpty)
                  for (int i = 0; i < testimonies.length; i++)
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 30, top: 5),
                      child: Text(
                        testimonies[i],
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                else
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(left: 30, top: 5),
                    child: const Text(
                      "Aucun témoignage n'a encore été ajouté.",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),

                // ================= CANDIDATE RATING =================

                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Note de $name",
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (rating != -1)
                      for (int i = 0; i < 5; i++)
                        if (i < rating)
                          const Icon(Icons.star, color: Colors.yellow)
                        else
                          const Icon(Icons.star, color: Colors.white)
                    else
                      Text(
                        "$name n'a pas encore été noté.",
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    // Icon(Icons.star, color: Colors.yellow),
                    // Icon(Icons.star, color: Colors.yellow),
                    // Icon(Icons.star, color: Colors.yellow),
                    // Icon(Icons.star, color: Colors.white),
                    // Icon(Icons.star, color: Colors.white),
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
