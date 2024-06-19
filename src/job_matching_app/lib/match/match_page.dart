import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:job_matching_app/main.dart';
import 'package:job_matching_app/settings/candidate_profile_settings_page.dart';
import 'package:job_matching_app/settings/company_profile_settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:job_matching_app/match/candidate_details_page.dart';
import 'package:job_matching_app/match/company_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key, required this.isCompanyView, required this.id});

  final int id;
  final bool isCompanyView;

  @override
  State<MatchPage> createState() =>
      _MatchPageState(isCompanyView: isCompanyView, id: id);
}

class _MatchPageState extends State<MatchPage> {
  bool isCompanyView;
  int id;

  _MatchPageState({required this.isCompanyView, required this.id});

  late bool darkMode;
  int length = 0;
  List<List<num>> data = [];
  List<int> ticks = [];
  List<String> features = [];
  bool useSides = false;
  List<int> idList = [];
  List<String> imagesListCandidates = [
    "giraffe",
    "lion",
    "koala",
    "kangaroo",
    "panda",
    "elephant",
    "renard",
    "loup",
    "zebre",
    "gorille",
  ];

  List<String> names = [];

  int cognitive = 80;
  int social = 70;
  int personality = 90;
  int credibility = 60;
  int compatibility = 85;

  List<int> matched = [];
  List<int> notMatched = [];

  List<String> jobNames = [];

  List<String> lastMoves = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
      "Motivation",
      "Créativité",
      "Imagin-\nation",
      "Collaboration",
      "Sang-froid",
      "Travailleur",
      "Optimisme",
    ];

    data = [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
    ];

    isCompanyView
        ? db
            .collection("Companies")
            .where('ID', isEqualTo: id)
            .get()
            .then((querySnapshot) {
              matched = querySnapshot.docs[0].data()['Matched'].cast<int>();
              notMatched =
                  querySnapshot.docs[0].data()['NotMatched'].cast<int>();
            })
            .then((value) => db
                    .collection("Users")
                    .where('ID', whereNotIn: matched)
                    .get()
                    .then((querySnapshot) {
                  data.clear();
                  for (int i = 0; i < querySnapshot.docs.length; i++) {
                    data.add([0, 0, 0, 0, 0, 0, 0]);
                    if (querySnapshot.docs[i].data()['ID'] != -1 &&
                        !notMatched
                            .contains(querySnapshot.docs[i].data()['ID'])) {
                      idList.add(querySnapshot.docs[i].data()['ID']);
                      length = i + 1;
                      names.add(querySnapshot.docs[i].data()['Pseudonyme']);
                      for (int j = 0; j < 7; j++) {
                        data[i][j] = querySnapshot.docs[i].data()['Graph'][j];
                      }
                    }
                  }
                }))
            .then((value) => setState(() {}))
        : db
            .collection("Users")
            .where('ID', isEqualTo: id)
            .get()
            .then((querySnapshot) {
              matched = querySnapshot.docs[0].data()['Matched'].cast<int>();
              notMatched =
                  querySnapshot.docs[0].data()['NotMatched'].cast<int>();
            })
            .then((value) => db
                    .collection("Companies")
                    .where('ID', whereNotIn: matched)
                    .get()
                    .then((querySnapshot) {
                  data.clear();
                  for (int i = 0; i < querySnapshot.docs.length; i++) {
                    if (querySnapshot.docs[i].data()['ID'] != -1 &&
                        !notMatched
                            .contains(querySnapshot.docs[i].data()['ID'])) {
                      data.add([0, 0, 0, 0, 0, 0, 0]);
                      idList.add(querySnapshot.docs[i].data()['ID']);
                      length = i + 1;
                      names.add(querySnapshot.docs[i].data()['Name']);
                      if (querySnapshot.docs[i].data()['Job'] != null) {
                        jobNames.add(querySnapshot.docs[i].data()['Job']);
                      }
                    }
                  }
                }))
            .then((value) => setState(() {}));
  }

  CardSwiperController cardController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    darkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    List<Container> cards = [];

    debugPrint('length: $length - ${matched.length}');

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
              stops: const [0.4, 0.7, 1],
              colors: [
                Colors.white,
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
                      ? (BuildContext context) => CandidateProfileSettingsPage(
                          isDetailsPage: false, id: idList[i])
                      : (BuildContext context) => CompanyProfileSettingsPage(
                          isDetailsPage: false, id: idList[i]),
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
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  100), // Border radius of the profile picture
                              child: isCompanyView
                                  ? Image.asset(getImageFromNickName(names[i]
                                      .substring(0, names[i].length - 3)))
                                  : Image.asset(
                                      "lib/assets/images/logo.png") // ADD IMAGE
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Text(
                    textAlign: TextAlign.start,
                    jobNames.isNotEmpty ? jobNames[i] : "",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontFamily: 'Shanti',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isCompanyView)
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
                if (isCompanyView)
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
                if (isCompanyView)
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
                if (isCompanyView)
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
                if (isCompanyView)
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
                if (isCompanyView)
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
                  )
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: cards.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: Image.asset(
                          'lib/assets/images/logo_gradient.png',
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                      ),
                    ],
                  ),
                  if (cards.length > 1)
                    CardSwiper(
                      isLoop: false,
                      controller: cardController,
                      cardsCount: cards.length,
                      allowedSwipeDirection: const AllowedSwipeDirection.only(
                        right: true,
                        left: true,
                        up: false,
                        down: false,
                      ),
                      cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) =>
                          cards[index],
                      onSwipe: (previousIndex, currentIndex, direction) async {
                        //  TODO
                        if (direction == CardSwiperDirection.left) {
                          notMatched.add(idList[previousIndex]);
                          setFirebaseData(
                              isCompanyView, id, 'NotMatched', notMatched);
                          lastMoves.add('left');
                        } else if (direction == CardSwiperDirection.right) {
                          matched.add(idList[previousIndex]);
                          setFirebaseData(
                              isCompanyView, id, 'Matched', matched);
                          List<int> matchList = isCompanyView ? getMatchlistFromId(false, id): getMatchlistFromId(true, id);
                          // !matchList.contains(id) ? null : 
                          lastMoves.add('right');
                        }
                        if (length - cards.length - 1 == 0) {
                          await showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Stack(
                                      clipBehavior: Clip.none,
                                      children: <Widget>[
                                        Positioned(
                                          right: -40,
                                          top: -40,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Icon(Icons.close),
                                            ),
                                          ),
                                        ),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  'Vous avez atteint la fin de la liste des candidats.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Shanti',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: ElevatedButton(
                                                  child: const Text(
                                                    textAlign: TextAlign.center,
                                                    'Revoir les candidats refusés',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Shanti',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    notMatched.clear();
                                                    notMatched.add(-1);
                                                    setFirebaseData(
                                                        isCompanyView,
                                                        id,
                                                        'NotMatched',
                                                        notMatched);
                                                    setState(() {});
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: ElevatedButton(
                                                  child: const Text(
                                                    'Fermer',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Shanti',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                        }
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
                            if (lastMoves.isNotEmpty) {
                              if (lastMoves.last == 'left') {
                                notMatched.removeLast();
                                setFirebaseData(isCompanyView, id, 'NotMatched',
                                    notMatched);
                              } else if (lastMoves.last == 'right') {
                                matched.removeLast();
                                setFirebaseData(
                                    isCompanyView, id, 'Matched', matched);
                              }
                              lastMoves.removeLast();
                            }
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
            )
          : lastMoves.isNotEmpty
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            if (lastMoves.isNotEmpty) {
                              if (lastMoves.last == 'left') {
                                notMatched.removeLast();
                                setFirebaseData(isCompanyView, id, 'NotMatched',
                                    notMatched);
                              } else if (lastMoves.last == 'right') {
                                matched.removeLast();
                                setFirebaseData(
                                    isCompanyView, id, 'Matched', matched);
                              }
                              lastMoves.removeLast();
                            }
                          },
                          icon: const Icon(
                            FontAwesome5.undo,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
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

String getImageFromNickName(String nickName) {
  switch (nickName) {
    case 'Giraffe' || 'giraffe':
      return 'lib/assets/images/giraffe.png';
    case 'Elephant' || 'Eléphant' || 'elephant' || 'eléphant':
      return 'lib/assets/images/elephant.png';
    case 'Gorille' || 'gorille' || 'Gorilla' || 'gorilla':
      return 'lib/assets/images/gorilla.png';
    case 'Lion' || 'lion':
      return 'lib/assets/images/lion.png';
    case 'Renard' || 'renard' || 'Fox' || 'fox':
      return 'lib/assets/images/fox.png';
    case 'Kangourou' || 'kangourou' || 'Kangaroo' || 'kangaroo':
      return 'lib/assets/images/kangaroo.png';
    case 'Loup' || 'loup' || 'Wolf' || 'wolf':
      return 'lib/assets/images/wolf.png';
    case 'Panda' || 'panda' || 'Panda Bear' || 'panda bear':
      return 'lib/assets/images/panda.png';
    case 'Zèbre' || 'Zebre' || 'zebre' || 'zèbre' || 'Zebra' || 'zebra':
      return 'lib/assets/images/zebra.png';
    case 'Koala' || 'koala' || 'Koala Bear' || 'koala bear':
      return 'lib/assets/images/koala.png';
    default:
      return 'lib/assets/images/logo.png';
  }
}

void setFirebaseData(bool isComapnyView, int id, String key, List<int> values) {
  debugPrint('setFirebaseData: id: $id, key: $key, value: $values');
  String docName = '';
  String collection;
  isCompanyView ? collection = 'Companies' : collection = 'Users';
  var db = FirebaseFirestore.instance;
  if (collection != '') {
    db.collection(collection).where('ID', isEqualTo: id).get().then(
      (querySnapshot) {
        docName = querySnapshot.docs[0].id;
      },
    ).then(
      (value) => db.collection(collection).doc(docName).update({
        key: values,
      }),
    );
  }
}


List<int> getMatchlistFromId(bool isCompany, int id) {
  List<int> matchList = [];
  String collection;
  isCompany ? collection = 'Companies' : collection = 'Users';
  var db = FirebaseFirestore.instance;
  if (collection != '') {
    db.collection(collection).where('ID', isEqualTo: id).get().then(
      (querySnapshot) {
        matchList = querySnapshot.docs[0].data()['Matched'].cast<int>();
      },
    );
  }
  return matchList;
}