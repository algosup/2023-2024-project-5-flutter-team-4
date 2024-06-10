import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:job_matching_app/match/candidate_details_page.dart';
import 'package:job_matching_app/match/company_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  late bool darkMode;
  bool isCompanyView = false;
  int length = 3;
  List<List<num>> data = [];
  List<int> ticks = [];
  List<String> features = [];
  bool useSides = false;
  int indexOfIds = 0;
  List<int> idList = [];
  List<String> imagesList = ["one", "two", "three", "four", "five"];

  List<String> names = [];

  int cognitive = 80;
  int social = 70;
  int personality = 90;
  int credibility = 60;
  int compatibility = 85;

  @override
  void initState() {
    super.initState();
    getSharedPreferences('isCompanyView').then((value) {
      isCompanyView = value;
    });
    Firebase.initializeApp();
    var db = FirebaseFirestore.instance;

    ticks = [
      10,
      20,
      30,
      40,
      50,
      60,
      70,
      80,
      90,
      100,
    ];

    features = [
      "AA",
      "BB",
      "CC",
      "DD",
      "EE",
      "FF",
      "GG",
    ];

    data = [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
    ];


    final docRef = db.collection("Users");
    docRef.where('hasGraph', isEqualTo: true).get().then((querySnapshot) {
      data.clear();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        data.add([0, 0, 0, 0, 0, 0, 0]);
        idList.add(querySnapshot.docs[i].data()['ID']);
        length = i + 1;
      }
      for (int j = 0; j < querySnapshot.docs.length; j++) {
        names.add(querySnapshot.docs[j].data()['Name']);
        for (int i = 0; i < 7; i++) {
          data[j][i] = querySnapshot.docs[j].data()['Graph'][i];
        }
      }
    }).then((value) => setState(() {}));
  }
    CardSwiperController cardController= CardSwiperController();

  @override
  Widget build(BuildContext context) {
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    List<Container> cards = [];

    for (int i = 0; i < length; i++) {
      cards.add(
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.3, 0.7, 1],
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade500,
                Colors.black,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: GestureDetector(
            onTapUp: (event) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: isCompanyView
                      ? (BuildContext context) =>
                          CandidateDetailsPage(id: idList[i])
                      : (BuildContext context) =>
                          CompanyDetailsPage(id: idList[i]),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.09,
                      height: MediaQuery.of(context).size.height * 0.09,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01,
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Container(
                        width: 84, // Width of the container

                        // Decoration of the container
                        decoration: BoxDecoration(
                          shape: BoxShape
                              .circle, // Shape of the container is a circle
                          gradient: RadialGradient(
                            // Gradient of the container
                            stops: const [0.6, 0.95], // Stops of the gradient
                            colors: [
                              Colors.white, // Color of the container
                              getColor(i), // Color of the container
                            ],
                          ),
                        ),

                        child: Transform.scale(
                          scale:
                              1.025, // Scale of the profile picture is set to 0.8
                          child: const ClipRRect(
                              // child: Image.asset( "lib/assets/images/${imagesList[i]}.png"),// ADD IMAGE
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: Text(
                        textAlign: TextAlign.start,
                        names.isNotEmpty ? names[i] : "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontFamily: 'Shanti',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        CircularProgressIndicator(
                          value: compatibility / 100,
                          backgroundColor: Colors.blueGrey.shade900,
                          color: Colors.lightGreen,
                          strokeWidth: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "$compatibility%",
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontFamily: 'Shanti',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey.shade900,
                        color: Colors.lightGreen,
                        value: cognitive / 100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.097,
                      ),
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey.shade900,
                        color: Colors.lightGreen,
                        value: social / 100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        "Cognitif",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.097,
                      ),
                      child: const Text(
                        "Social",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey.shade900,
                        color: Colors.lightGreen,
                        value: personality / 100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.097,
                      ),
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey.shade900,
                        color: Colors.lightGreen,
                        value: credibility / 100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Text(
                        "Personnalité",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.097,
                      ),
                      child: const Text(
                        "Crédibilité",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Text(
                    "Cognitif",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: 'Shanti',
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: darkMode
                      ? RadarChart.dark(
                          ticks: ticks,
                          features: features,
                          data: [data[i]],
                          reverseAxis: true,
                          useSides: useSides,
                        )
                      : RadarChart.light(
                          ticks: ticks,
                          features: features,
                          data: [data[i]],
                          reverseAxis: false,
                          useSides: useSides,
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 0.7],
            colors: [
              Color.fromARGB(255, 169, 38, 135),
              Color.fromARGB(255, 215, 0, 123),
            ],
          ),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Text(
                    "Adopte 1\nCandidat",
                    style: TextStyle(
                      // color: Theme.of(context).colorScheme.onBackground,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontFamily: 'MontserratAlternates',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            CardSwiper(
              controller: cardController,
              cardsCount: cards.length,
              allowedSwipeDirection: const AllowedSwipeDirection.only(
                right: true,
                left: true,
                up: false,
                down: false,
              ),
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      cards[index],
              onSwipe: (previousIndex, currentIndex, direction) {
                //  TODO
                if (direction == CardSwiperDirection.left) {
                  // Dislike
                } else if (direction == CardSwiperDirection.right) {
                  // Like
                }
                indexOfIds = currentIndex!;
                return true;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.76,
                    // left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.red,
                    ),
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.18,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      cardController.swipe(CardSwiperDirection.left);
                    },
                    icon: const Icon(
                      WebSymbols.cancel,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.77,
                    // left: MediaQuery.of(context).size.width * 0.43,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.yellow,
                    ),
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: IconButton(
                    iconSize: 25,
                    onPressed: () {
                      cardController.undo();

                    },
                    icon: const Icon(
                      FontAwesome5.undo,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.76,
                    // left: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.green,
                    ),
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.18,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      cardController.swipe(CardSwiperDirection.right);

                    },
                    icon: const Icon(
                      FontAwesome5.heart,
                      color: Colors.green,
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

Future<bool> getSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool(key) ?? false;
  return value;
}

Color getColor(int index) {
  switch (index) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.orange;
    case 2:
      return Colors.yellow;
    case 3:
      return Colors.green.shade800;
    case 4:
      return Colors.blue.shade100;
    case 5:
      return Colors.indigo;
    case 6:
      return Colors.purple;
    case 7:
      return Colors.pink;
    case 8:
      return Colors.teal;
    case 9:
      return Colors.limeAccent.shade700;
    default:
      return Colors.black;
  }
}
