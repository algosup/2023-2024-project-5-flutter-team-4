import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key, required this.id});

  final int id;

  @override
  State<MessagesPage> createState() => _MessagesPageState(id: id);
}

class _MessagesPageState extends State<MessagesPage> {
  var id;

  _MessagesPageState({required this.id});

  FirebaseFirestore db = FirebaseFirestore.instance;

  int convNum = 2;

  @override
  void initState() {
    super.initState();

    id = 0;

    db = FirebaseFirestore.instance;

    db.collection('Companies').where("").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == id) {
            if (result.data().containsKey("Conv")) {
              Map<String, dynamic> conv = result.data();
              List<String> keys = conv.keys.toList();
              print(keys);
            }
            break;
          }
        }
      },
    ).then(
      (value) => setState(() {
        // print(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 169, 38, 135),
            Color.fromARGB(255, 215, 0, 123),
          ],
        )),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  width: width * 0.15,
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  width: width * 0.5,
                  child: const Text(
                    "Messages",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Shanti',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.15, top: 25.0),
                  width: width * 0.2,
                  child: const IconButton(
                    icon: Icon(Icons.search, color: Colors.white, size: 30),
                    onPressed: null,
                  ),
                ),
              ],
            ),
            for (int i = 0; i < convNum; i++)
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.2,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.5,
                      height: 80,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              "Company Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Shanti',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text(
                              "Last Message",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Shanti',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.1,
                      height: 80,
                      child: const Icon(Icons.arrow_forward_ios,
                          color: Colors.black, size: 30),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
