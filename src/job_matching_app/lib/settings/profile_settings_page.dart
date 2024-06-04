import 'package:flutter/material.dart';
import 'package:job_matching_app/settings/more_settings_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;
  bool isCompanyView = false;

  int companyID = 0;

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
          if (result.data()["ID"] == companyID ){
            if (result.data()["Name"] != null) {
              name = result.data()["Name"];
            }
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Your Profile",
            style: TextStyle(
              color: Colors.black,
            )),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.secondary,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: TextEditingController(
                  text: name.isEmpty ? "" : name,
                ),
                onChanged: (value) => name = value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          db
              .collection('Companies')
              .where('ID', isEqualTo: companyID)
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
