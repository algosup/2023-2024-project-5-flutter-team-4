import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:job_matching_app/candidate_details_page.dart';
import 'package:job_matching_app/company_details_page.dart';
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
  int ID = 0;

  @override
  void initState() {
    super.initState();
    getSharedPreferences('isCompanyView').then((value) {
      isCompanyView = value;
    });
    Firebase.initializeApp();
    var db = FirebaseFirestore.instance;

    ticks = [
      0,
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
      "HH",
    ];

    data = [
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
    ];

    final  docRef = db.collection("Users");
    docRef.where('hasGraph', isEqualTo: true).get().then((querySnapshot) {
      debugPrint("legnth: ${querySnapshot.docs.length}");
      data.clear();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        data.add([0, 0, 0, 0, 0, 0, 0, 0]);
        length = i + 1;
      }
      for (int j = 0; j < querySnapshot.docs.length; j++) {
        debugPrint("data: ${querySnapshot.docs[j].data()}");
        for (int i = 0; i < 8; i++) {
          data[j][i] = querySnapshot.docs[j].data()['Graph'][i];
        }
      }
      debugPrint("data length: $length");
      debugPrint("data content: $data");
    }).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    List<Container> cards = [];

    for (int i = 0; i < length; i++) {
      cards.add(
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
          alignment: Alignment.center,
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: isCompanyView
                  ? (BuildContext context) => const CandidateDetailsPage()
                  : (BuildContext context) => CompanyDetailsPage(ID),
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
