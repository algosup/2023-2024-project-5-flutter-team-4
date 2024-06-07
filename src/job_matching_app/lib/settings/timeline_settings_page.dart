import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:timeline_tile/timeline_tile.dart';

// import 'package:fluttericon/font_awesome_icons.dart';

class TimelineSettingsPage extends StatefulWidget {
  const TimelineSettingsPage({super.key, required this.id});

  final int id;

  @override
  State<TimelineSettingsPage> createState() =>
      _TimelineSettingsPageState(id: id);
}

class _TimelineSettingsPageState extends State<TimelineSettingsPage> {
  var id;
  _TimelineSettingsPageState({required this.id});

  List<String> dates = [];
  List<String> datesSaved = [];
  List<String> datesDescription = [];
  List<String> datesDescriptionSaved = [];

  FirebaseFirestore db = FirebaseFirestore.instance;
  String docName = "";

  bool saved = true;

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;

    db.collection('Companies').get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == id) {
            if (result.data()["Dates"] != null) {
              dates = result.data()["Dates"].cast<String>();
              datesSaved = result.data()["Dates"].cast<String>();
            }
            if (result.data()["DatesDescription"] != null) {
              datesDescription =
                  result.data()["DatesDescription"].cast<String>();
              datesDescriptionSaved =
                  result.data()["DatesDescription"].cast<String>();
            }
            break;
          }
        }
      },
    ).then(
      (value) => setState(() {}),
    );
  }

  int addNodes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 169, 38, 135),
            Color.fromARGB(255, 215, 0, 123),
          ],
        )),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: ListView(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 40),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < dates.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dates.removeAt(i);
                      datesDescription.removeAt(i);
                      FocusScope.of(context).unfocus();
                      if (dates.length > datesSaved.length ||
                          dates.length < datesSaved.length) {
                        saved = false;
                      } else {
                        saved = true;
                      }
                    });
                  },
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.end,
                    beforeLineStyle: const LineStyle(
                      color: Colors.blue,
                      thickness: 8,
                    ),
                    afterLineStyle: const LineStyle(
                      color: Colors.blue,
                      thickness: 8,
                    ),
                    indicatorStyle: IndicatorStyle(
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.remove_circle_outline_rounded,
                      ),
                      width: 35,
                      color: Colors.blue,
                    ),
                    isFirst: i == 0 ? true : false,
                    isLast: i == dates.length - 1 ? true : false,
                    startChild: Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 15, top: 30),
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.width * 0.25,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            TextFieldTapRegion(
                              onTapOutside: (PointerDownEvent) {
                                FocusScope.of(context).unfocus();
                              },
                              child: TextField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                  text: dates.isNotEmpty ? dates[i] : "",
                                ),
                                onSubmitted: (value) => {
                                  dates[i] = value,
                                  setState(() {
                                    if (dates[i] != datesSaved[i]) {
                                      saved = false;
                                    } else {
                                      saved = true;
                                    }
                                  })
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter a date',
                                ),
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Shanti',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextField(
                              maxLines: null,
                              controller: TextEditingController(
                                text: datesDescription[i],
                              ),
                              textAlign: TextAlign.center,
                              onSubmitted: (value) => {
                                datesDescription[i] = value,
                                setState(() {
                                  if (datesDescription[i] !=
                                      datesDescriptionSaved[i]) {
                                    saved = false;
                                  } else {
                                    saved = true;
                                  }
                                })
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add a description of the date',
                              ),
                              style: const TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Shanti',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary),
                    shape: MaterialStateProperty.all<CircleBorder>(
                      CircleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      dates.add('');
                      datesDescription.add('');
                      if (dates.length > datesSaved.length ||
                          dates.length < datesSaved.length) {
                        saved = false;
                      } else {
                        saved = true;
                      }
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            saved ? Theme.of(context).colorScheme.secondary : Colors.red,
        onPressed: () {
          db
              .collection('Companies')
              .where('ID', isEqualTo: id)
              .get()
              .then(
                (querySnapshot) {
                  docName = querySnapshot.docs[0].id;
                },
              )
              .then(
                (value) => db.collection('Companies').doc(docName).update({
                  "Dates": dates,
                  "DatesDescription": datesDescription,
                }),
              )
              .then(
                (value) => setState(() {
                  datesSaved = List.from(dates);
                  datesDescriptionSaved = List.from(datesDescription);
                  saved = true;
                }),
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
