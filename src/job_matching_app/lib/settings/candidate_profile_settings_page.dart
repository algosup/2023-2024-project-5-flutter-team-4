import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_matching_app/settings/more_settings_page.dart';

import 'package:job_matching_app/settings/timeline_settings_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geocoding/geocoding.dart';

class CandidateProfileSettingsPage extends StatefulWidget {
  const CandidateProfileSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CandidateProfileSettingState createState() =>
      _CandidateProfileSettingState();
}

class _CandidateProfileSettingState
    extends State<CandidateProfileSettingsPage> {
  bool isDarkMode = false;
  bool isCompanyView = false;

  final int ID = 1;

  String name = "";

  String docName = "";

  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isModifying = false;

  // ignore: prefer_const_constructors
  List<double> cityCoordinates = [0, 0];
  String city = "";

  List<String> notUsedNames = [
    "Portfolios",
    "CVs",
    "Stories Vidéo",
    "Mini-Jeux",
    "Accomplissements",
    "Actvité Sportive",
    "Certifications",
    "Passes-Temps",
  ];

  String pseudo = "";

  @override
  void initState() {
    super.initState();

    db = FirebaseFirestore.instance;

    db
        .collection('Users')
        .get()
        .then(
          (querySnapshot) {
            for (var result in querySnapshot.docs) {
              if (result.data()["ID"] == ID) {
                if (result.data()["Name"] != null) {
                  name = result.data()["Name"];
                }
                if (result.data()["Pseudonyme"] != null) {
                  pseudo = result.data()["Pseudonyme"];
                }
                if (result.data()["Location"].latitude != null &&
                    result.data()["Location"].longitude != null) {
                  cityCoordinates[0] = result.data()["Location"].latitude;
                  cityCoordinates[1] = result.data()["Location"].longitude;
                }
                docName = result.id;
                break;
              }
            }
          },
        )
        .then((value) =>
            getCityFromCoordinates(cityCoordinates[0], cityCoordinates[1]))
        .then((value) => setState(() {
              city = value;
              print(city);
            }));
  }

  int percentage = 97;

  String distanceMessage = "A 32km du lieu de travail";

  String age = "21";

  @override
  Widget build(BuildContext context) {
    Gradient gradientColored = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 215, 0, 123),
        Color.fromARGB(255, 169, 38, 135),
      ],
    );
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var showing = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: ListView(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => {
                      if (!isModifying)
                        {
                          setState(() {
                            isModifying = true;
                          }),
                        }
                    },
                    child: const Text(
                      'Modifier',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Shanti',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade500,
                    thickness: 2.0,
                    width: 1.0,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => {},
                    child: const Text(
                      'Aperçu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 215, 0, 123),
                        fontFamily: 'Shanti',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Container(
                margin: EdgeInsets.only(top: width * 0.05),

                // Decoration of the container
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Shape of the container is a circle
                  gradient: RadialGradient(
                    // Gradient of the container
                    stops: [0.6, 0.95], // Stops of the gradient
                    colors: [
                      Colors.white, // Color of the container
                      Colors.cyan, // Color of the container
                    ],
                  ),
                ),

                child: Transform.scale(
                  scale: 1.025, // Scale of the profile picture is set to 0.8
                  child: const ClipRRect(
                      // child: Image.asset( "lib/assets/images/${imagesList[i]}.png"),// ADD IMAGE
                      ),
                ),
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: TextFieldTapRegion(
                onTapOutside: (PointerDownEvent) {
                  FocusScope.of(context).unfocus();
                },
                child: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                    text: pseudo.isEmpty ? "" : "${pseudo.substring(0, pseudo.length - 3)} Anonyme",
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    'Crédibilité: $percentage%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.54,
                  height: width * 0.03,
                  margin: EdgeInsets.only(left: width * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    // border: const Border.fromBorderSide(BorderSide(
                    //   color: Colors.black,
                    //   width: 1.0,
                    // )),
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10.0),
                    value: percentage / 100,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.tealAccent.shade400),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Soft Skills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.45),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Localisation:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.39,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    distanceMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.03),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  width: width * 0.37,
                  height: height * 0.03,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Bio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.03,
                right: width * 0.03,
              ),
              child: TextField(
                readOnly: true,
                maxLines: null,
                textAlign: TextAlign.center,
                controller: TextEditingController(
                  text:
                      "Concepteur/Développeur d'applications passioné et actuellement en 4ème année à ALGOSUP, j'utilise les dernières technologies au service de l'innovation dans ma région.",
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Parcours',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.45),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.77,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Tests Psychométriques',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );

    var modifiying = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: ListView(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => {
                      null,
                    },
                    child: const Text(
                      'Modifier',
                      style: TextStyle(
                        color: Color.fromARGB(255, 215, 0, 123),
                        fontFamily: 'Shanti',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade500,
                    thickness: 2.0,
                    width: 1.0,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () => {
                      if (isModifying)
                        {
                          setState(() {
                            isModifying = false;
                          }),
                        }
                    },
                    child: const Text(
                      'Aperçu',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Shanti',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Container(
                margin: EdgeInsets.only(top: width * 0.05),

                // Decoration of the container
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Shape of the container is a circle
                  gradient: RadialGradient(
                    // Gradient of the container
                    stops: [0.6, 0.95], // Stops of the gradient
                    colors: [
                      Colors.white, // Color of the container
                      Colors.yellow, // Color of the container
                    ],
                  ),
                ),

                child: Transform.scale(
                  scale: 1.025, // Scale of the profile picture is set to 0.8
                  child: const ClipRRect(
                      // child: Image.asset( "lib/assets/images/${imagesList[i]}.png"),// ADD IMAGE
                      ),
                ),
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: TextFieldTapRegion(
                onTapOutside: (PointerDownEvent) {
                  FocusScope.of(context).unfocus();
                },
                child: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                    text: name.isEmpty ? "" : "$name, $age ans",
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    'Crédibilité: $percentage%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.54,
                  height: width * 0.03,
                  margin: EdgeInsets.only(left: width * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                    // border: const Border.fromBorderSide(BorderSide(
                    //   color: Colors.black,
                    //   width: 1.0,
                    // )),
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10.0),
                    value: percentage / 100,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.tealAccent.shade400),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Soft Skills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.45),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Localisation:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.39,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    overflow: TextOverflow.ellipsis,
                    'Vierzon + 50km',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.03),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  width: width * 0.37,
                  height: height * 0.03,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Bio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.43),
                  width: width * 0.14,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.03,
                right: width * 0.03,
              ),
              child: TextField(
                readOnly: true,
                maxLines: null,
                textAlign: TextAlign.center,
                controller: TextEditingController(
                  text:
                      "Concepteur/Développeur d'applications passioné et actuellement en 4ème année à ALGOSUP, j'utilise les dernières technologies au service de l'innovation dans ma région.",
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.37,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Dates Clé',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.45),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.77,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: const Text(
                    'Tests Psychométriques',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  child: const Text(
                    'Ajouter plus d\'informations...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            for (int k = 0; k < notUsedNames.length *2; k++)
            k % 2 == 0
            ? Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.77,
                  height: height * 0.06,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    notUsedNames[k ~/ 2],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Shanti',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05),
                  width: width * 0.08,
                  child: IconButton(
                    iconSize: width * 0.08,
                    onPressed: () {
                      null;
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              ],
            )
            : const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );




    //----------------- RETURN -----------------
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: width * 0.15),
            child: Image.asset(
              'lib/assets/images/logo_gradient.png',
              width: width * 0.4,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.ios_share_rounded,
              color: Colors.black,
              size: width * 0.1,
            ),
            onPressed: () {
              null;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const MoreSettingsPage(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: isModifying ? modifiying : showing,
    );
  }
}

Future<Location> getCoordinatesFromCity(String key) async {
  List<Location> locations = await locationFromAddress(key);
  for (var location in locations) {
    debugPrint('location: $location');
  }
  return locations[0];
}

Future<String> getCityFromCoordinates(double latitude, double longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  return placemarks[0].locality!;
}
