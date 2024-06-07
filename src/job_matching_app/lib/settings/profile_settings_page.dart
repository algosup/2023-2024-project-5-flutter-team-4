import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_matching_app/settings/more_settings_page.dart';

import 'package:job_matching_app/settings/timeline_settings_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_geocoder/geocoder.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;
  bool isCompanyView = false;

  final int ID = 0;

  String name = "";

  String docName = "";

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    db = FirebaseFirestore.instance;

    db.collection('Companies').get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == ID) {
            if (result.data()["Name"] != null) {
              name = result.data()["Name"];
            }
            docName = result.id;
            break;
          }
        }
      },
    ).then(
      (value) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Your Profile",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Shanti',
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MoreSettingsPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.settings_suggest_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 169, 38, 135),
                Color.fromARGB(255, 215, 0, 123),
              ],
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFieldTapRegion(
                  onTapOutside: (PointerDownEvent) {
                    FocusScope.of(context).unfocus();
                  },
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: TextEditingController(
                      text: name.isEmpty ? "" : name,
                    ),
                    onChanged: (value) => name = value,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          TimelineSettingsPage(id: ID),
                    ),
                  ),
                  icon: const Icon(Icons.timeline_sharp),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller:
                          TextEditingController(text: 'To Be Implemented'),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Location',
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (docName.isNotEmpty) {
                          getCoordinatesFromCity('Vierzon').then(
                            (value) =>
                                db.collection('Companies').doc(docName).update({
                              "Location":
                                  GeoPoint(value.latitude!, value.longitude!),
                            }),
                          );
                          // .then((value) => getCityFromCoordinates(value)).then((value) => debugPrint(value));
                        }
                      },
                      icon: const Icon(
                        Icons.check_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          db
              .collection('Companies')
              .where('ID', isEqualTo: ID)
              .get()
              .then(
                (querySnapshot) {
                  docName = querySnapshot.docs[0].id;
                },
              )
              .then(
                (value) => db.collection('Companies').doc(docName).update({
                  "Name": name,
                }),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: const Icon(
          Icons.save,
          color: Colors.black,
        ),
      ),
    );
  }
}

Future<Coordinates> getCoordinatesFromCity(String key) async {
  // From a query
  final query = key;
  var addresses = await Geocoder.local.findAddressesFromQuery(query);
  var first = addresses.first;
  return first.coordinates;
}

Future<String> getCityFromCoordinates(Coordinates coordinates) async {
  // From coordinates
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  return first.locality!;
}
