import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'conversation_page.dart';

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

  int convNum = 0;

  List<List<String>> conversations = [[]];

  List<List<int>> companies = [[]];

  final Gradient gradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 215, 0, 123),
      Color.fromARGB(255, 169, 38, 135),
    ],
  );

  @override
  void initState() {
    super.initState();

    conversations.clear();
    companies.clear();

    id = 0;

    db = FirebaseFirestore.instance;

    db.collection('Companies').where("").get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          if (result.data()["ID"] == id) {
            convNum = result.data()["ConvNum"];
            for (int i = 1; i <= convNum; i++) {
              conversations.add(result.data()["Conv$i"].cast<String>());
              companies.add(result.data()["ConvW$i"].cast<int>());
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
        decoration: BoxDecoration(
          gradient: gradient,
        ),
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
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade500,
                      Colors.black,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.2,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: 84, // Width of the container

                        // Decoration of the container
                        decoration: const BoxDecoration(
                          shape: BoxShape
                              .circle, // Shape of the container is a circle
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
                          scale:
                              1.025, // Scale of the profile picture is set to 0.8
                          child: const ClipRRect(
                              // child: Image.asset( "lib/assets/images/${imagesList[i]}.png"),// ADD IMAGE
                              ),
                        ),
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
                            child: Text(
                              conversations.isNotEmpty
                                  ? conversations[i][0]
                                  : "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Shanti',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                (companies[i][companies[i].length - 1] == 0
                                        ? "him: "
                                        : "vous: ") +
                                    (conversations.isEmpty
                                        ? ""
                                        : conversations[i]
                                            [conversations[i].length - 1]),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Shanti',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.1,
                      height: 80,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ConversationPage(
                                      convId: i,
                                      conversation: conversations[i],
                                      companies: companies[i]),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add_comment_rounded, color: Colors.black, size: 30),
      )
    );
  }
}
