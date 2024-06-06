import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:job_matching_app/match/candidate_details_page.dart';
import 'package:job_matching_app/match/company_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
  bool useSides = true;
  int indexOfIds = 0;
  List<int> idList = [];
  List<String> imagesList = ["one", "two", "three", "four", "five"];

  List<String> names = [];

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

  @override
  Widget build(BuildContext context) {
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    List<Container> cards = [];

    for (int i = 0; i < length; i++) {
      cards.add(
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
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
                      decoration: const BoxDecoration(
                        shape: BoxShape
                            .circle, // Shape of the container is a circle
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors
                                .black, // Color of the border is set to black
                            width: 4.0, // Width of the border is set to 2.0
                          ),
                        ),

                        // Background of the container is set to transparent
                        color: Colors.transparent,
                      ),

                      child: Transform.scale(
                        scale:
                            1.025, // Scale of the profile picture is set to 0.8
                        child: ClipRRect(
                          child: Image.asset(
                              "lib/assets/images/${imagesList[i]}.png"), // Image's link of the profile picture
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        names.isNotEmpty 
                        ? names[i]
                        : "Name",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontFamily: 'Shanti',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
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
      );
    }
    return Scaffold(
      body: CardSwiper(
        cardsCount: cards.length,
        allowedSwipeDirection: const AllowedSwipeDirection.only(
          right: true,
          left: true,
          up: false,
          down: false,
        ),
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            cards[index],
        onSwipe: (previousIndex, currentIndex, direction) {
          indexOfIds = currentIndex!;
          return true;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: isCompanyView
                  ? (BuildContext context) =>
                      CandidateDetailsPage(id: idList[indexOfIds])
                  : (BuildContext context) =>
                      CompanyDetailsPage(id: idList[indexOfIds]),
            ),
          );
        },
        child: const Icon(Icons.zoom_out_map_rounded, color: Colors.black),
      ),
    );
  }
}

Future<bool> getSharedPreferences(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool(key) ?? false;
  return value;
}
