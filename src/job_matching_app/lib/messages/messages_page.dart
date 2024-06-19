// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'conversation_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage(
      {super.key, required this.id, required this.isCompanyView});

  final int id;
  final bool isCompanyView;

  @override
  // ignore: no_logic_in_create_state
  State<MessagesPage> createState() =>
      _MessagesPageState(id: id, isCompanyView: isCompanyView);
}

class _MessagesPageState extends State<MessagesPage> {
  var id;
  var isCompanyView;

  _MessagesPageState({required this.id, required this.isCompanyView});

  FirebaseFirestore db = FirebaseFirestore.instance;

  int conversationNum = 0;

  List<List<String>> messages = [[]];

  List<List<int>> companies = [[]];

  List<Timestamp> lastMessage = [];

  List<int> messagesList = [];

  List<int> otherList = [];

  List<int> matchListOther = [];

  List<String> conversationsList = [];

  List<String> conversationsIds = [];

  List<String> conversationsNames = [];

  List<String> otherNames = [];

  String yourName = "";

  bool reload = true;

  @override
  void initState() {
    super.initState();

    messages.clear();
    companies.clear();
    lastMessage.clear();
    messagesList.clear();

    db = FirebaseFirestore.instance;

    // Get the list of all conversations (IDS are stored in the form "CompanyID:UserID" in the IDS field of each document)
    db
        .collection("Conversations")
        .where("")
        .get()
        .then((value) => value.docs.forEach((element) {
              if (isCompanyView) {
                if (int.parse(element.data()["IDS"].toString().split(":")[0]) ==
                    id) {
                  conversationsList.add(element.data()["IDS"]);
                  messages.add(element.data()["Messages"].cast<String>());
                  companies.add(element.data()["MessagesW"].cast<int>());
                  lastMessage.add(element.data()["Dates"]
                      [element.data()["Dates"].length - 1] as Timestamp);
                  conversationsNames.add(element.data()["Names"]);
                  conversationsIds.add(element.data()["IDS"]);
                  conversationNum++;
                }
              } else {
                if (int.parse(element.data()["IDS"].toString().split(":")[1]) ==
                    id) {
                  conversationsList.add(element.data()["IDS"]);
                  messages.add(element.data()["Messages"].cast<String>());
                  companies.add(element.data()["MessagesW"].cast<int>());
                  lastMessage.add(element.data()["Dates"]
                      [element.data()["Dates"].length - 1] as Timestamp);
                  conversationsNames.add(element.data()["Names"]);
                  conversationsIds.add(element.data()["IDS"]);
                  conversationNum++;
                }
              }
            }))
        .then((value) => setState(() {}));

    !isCompanyView
        ? db.collection('Users').where("").get().then(
            (querySnapshot) {
              for (var result in querySnapshot.docs) {
                if (result.data()["ID"] == id) {
                  matchListOther = result.data()["Matched"].cast<int>();
                  break;
                }
              }
            },
          ).then(
            (value) => setState(() {}),
          )
        : db.collection('Companies').where("").get().then(
            (querySnapshot) {
              for (var result in querySnapshot.docs) {
                if (result.data()["ID"] == id) {
                  matchListOther = result.data()["Matched"].cast<int>();
                  break;
                }
              }
            },
          ).then(
            (value) => setState(() {}),
          );

    isCompanyView
        ? getUsersList().then((value) => otherList = value).then(
              (value) => setState(() {}),
            )
        : getCompaniesList().then((value) => otherList = value).then(
              (value) => setState(() {}),
            );
    debugPrint('List before: $otherList');
    isCompanyView
        ? getNameFromId(id, isCompanyView, true)
            .then((value) => yourName = value)
            .then(
              (value) => setState(() {}),
            )
        : getNameFromId(id, isCompanyView, false)
            .then((value) => yourName = value)
            .then(
              (value) => setState(() {}),
            );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint(conversationsList.toString());
    // for (int h = 0; h < otherList.length; h++) {
    //   debugPrint('${getCompanyMatchList(otherList[h], id)}');
    // }

    // if (reload && index != -1) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (BuildContext context) => ConversationPage(
    //           names: isCompanyView
    //               ? "${getNameFromId(id, true)}:${getNameFromId(otherList[index], false)}"
    //               : "${getNameFromId(otherList[index], true)}:${getNameFromId(id, false)}",
    //           messages: const ["Ceci est le début de votre conversation"],
    //           sender: const [2],
    //           isCompany: isCompanyView,
    //         ),
    //       ),
    //     );
    // }
    if (otherList.isNotEmpty) {
      if (otherNames.length != otherList.length) {
        otherNames = List.filled(otherList.length, "");
      }
      for (int y = 0; y < otherList.length; y++) {
        isCompanyView
            ? getNameFromId(otherList[y], !isCompanyView, false).then((value) {
                otherNames[y] = value;
              }).then((value) => debugPrint('Other names: $otherNames')).then(
                (value) => reload ? setState(() {reload = false;}) : null,
              )
            : getNameFromId(otherList[y], !isCompanyView, true).then((value) {
                otherNames[y] = value;
              }).then((value) => debugPrint('Other names: $otherNames')).then(
                (value) => reload ? setState(() {reload = false;}) : null,
              );
      }
    }

    debugPrint('Your name: $yourName');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //   gradient: gradient,
        // ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25.0, left: width * 0.03),
                  width: width * 0.15,
                  child: Image.asset(
                    'lib/assets/images/icon_gradient.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  width: width * 0.3,
                  // color: Colors.cyan,
                  child: const Text(
                    "Messages",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Shanti',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.32, top: 25.0),
                  width: width * 0.2,
                  // color: Colors.yellow,
                  child: const IconButton(
                    icon: Icon(Icons.search, color: Colors.grey, size: 30),
                    onPressed: null,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: height * 0.8109,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < conversationNum; i++)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ConversationPage(
                                names: conversationsNames[i],
                                messages: messages[i],
                                sender: companies[i],
                                isCompany: isCompanyView,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              Colors.transparent, // Background color
                          shadowColor:
                              Colors.transparent, // Remove shadow if any
                          surfaceTintColor:
                              Colors.transparent, // Remove shadow if any
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10.0,
                              bottom: i == conversationNum - 1 ? 10.0 : 0.0),
                          width: width * 0.9,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape
                                        .circle, // Shape of the container is a circle
                                    gradient: RadialGradient(
                                      // Gradient of the container
                                      stops: const [
                                        0.6,
                                        0.95
                                      ], // Stops of the gradient
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
                                          100), // Border radius of the profile picture is set to 100
                                      child: Image.asset(
                                          'lib/assets/images/logo.png'), // ADD IMAGE
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
                                        messages.isNotEmpty
                                            ? isCompanyView
                                                ? conversationsNames[i]
                                                    .split(':')[1]
                                                : conversationsNames[i]
                                                    .split(':')[0]
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
                                          (companies[i][companies[i].length -
                                                          1] ==
                                                      0
                                                  ? isCompanyView
                                                      ? "${conversationsNames[i].split(':')[1]}: "
                                                      : "vous: "
                                                  : companies[i][companies[i]
                                                                  .length -
                                                              1] ==
                                                          2
                                                      ? ""
                                                      : isCompanyView
                                                          ? "vous: "
                                                          : "${conversationsNames[i].split(':')[0]}: ") +
                                              (messages.isEmpty
                                                  ? ""
                                                  : messages[i]
                                                      [messages[i].length - 1]),
                                          style: const TextStyle(
                                              color: Colors.black,
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
                                child: const Icon(Icons.arrow_forward_ios,
                                    color: Colors.black, size: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    for (int h = 0; h < otherList.length; h++)
                      if (matchListOther.contains(otherList[h]) &&
                          !conversationsIds.contains(isCompanyView
                              ? "$id:${otherList[h]}"
                              : "${otherList[h]}:$id"))
                        ElevatedButton(
                          onPressed: () {
                            isCompanyView
                                ? createNewConversation(
                                    '$yourName:${otherNames[h]}',
                                    id,
                                    otherList[h])
                                : createNewConversation(
                                    "${otherNames[h]}:$yourName",
                                    otherList[h],
                                    id);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                            conversationsNames.add(isCompanyView
                                ? "$yourName:${otherNames[h]}"
                                : "${otherNames[h]}:$yourName");
                            conversationsIds.add(isCompanyView
                                ? "$id:${otherList[h]}"
                                : "${otherList[h]}:$id");
                            conversationNum++;
                            conversationsList.add(isCompanyView
                                ? "$id:${otherList[h]}"
                                : "${otherList[h]}:$id");
                            messages.add(
                                ["Ceci est le début de votre conversation"]);
                            companies.add([2]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ConversationPage(
                                  names: isCompanyView
                                      ? "$yourName:${otherNames[h]}"
                                      : "${otherNames[h]}:$yourName",
                                  messages: const [
                                    "Ceci est le début de votre conversation"
                                  ],
                                  sender: const [2],
                                  isCompany: isCompanyView,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:
                                Colors.transparent, // Background color
                            shadowColor:
                                Colors.transparent, // Remove shadow if any
                            surfaceTintColor:
                                Colors.transparent, // Remove shadow if any
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: h == conversationNum - 1 ? 10.0 : 0.0),
                            width: width * 0.9,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
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
                                    decoration: BoxDecoration(
                                      shape: BoxShape
                                          .circle, // Shape of the container is a circle
                                      gradient: RadialGradient(
                                        // Gradient of the container
                                        stops: const [
                                          0.6,
                                          0.95
                                        ], // Stops of the gradient
                                        colors: [
                                          Colors
                                              .white, // Color of the container
                                          getColor(h), // Color of the container
                                        ],
                                      ),
                                    ),

                                    child: Transform.scale(
                                      scale:
                                          1.025, // Scale of the profile picture is set to 0.8
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            100), // Border radius of the profile picture is set to 100
                                        child: Image.asset(
                                            'lib/assets/images/logo.png'), // ADD IMAGE
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
                                      Flexible(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "Vous avez un match avec ${otherNames[h]} !",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Shanti',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
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
                                  child: const Icon(Icons.arrow_forward_ios,
                                      color: Colors.black, size: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   backgroundColor: Colors.white,
      //   child: const Icon(Icons.add_comment_rounded,
      //       color: Colors.black, size: 30),
      // ),
    );
  }
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

List<int> sortMessages(List<Timestamp> list, List<int> messages) {
  List<int> sortedList = [];
  Timestamp max = Timestamp(0, 0);
  int maxIndex = -1;
  for (int j = 0; j < list.length; j++) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].seconds > max.seconds) {
        max = list[i];
        maxIndex = i;
      }
    }
    sortedList.add(messages[maxIndex]);
    list[maxIndex] = Timestamp(0, 0);
    max = Timestamp(0, 0);
    maxIndex = -1;
  }
  return sortedList;
}

String getImageFromNickName(String nickName) {
  switch (nickName) {
    case 'Giraffe':
      return 'lib/assets/images/giraffe.png';
    case 'Elephant' || 'Eléphant':
      return 'lib/assets/images/elephant.png';
    case 'Gorille':
      return 'lib/assets/images/gorilla.png';
    case 'Lion':
      return 'lib/assets/images/lion.png';
    case 'Renard':
      return 'lib/assets/images/fox.png';
    case 'Kangourou':
      return 'lib/assets/images/kangaroo.png';
    case 'Loup':
      return 'lib/assets/images/wolf.png';
    case 'Panda':
      return 'lib/assets/images/panda.png';
    case 'Zèbre' || 'Zebre':
      return 'lib/assets/images/zebra.png';
    case 'Koala':
      return 'lib/assets/images/koala.png';
    default:
      return 'lib/assets/images/logo.png';
  }
}

// Returns true if the company is a match with the user
bool getUserMatchList(
    int userId, int companyId, List<String> conversationsIds) {
  List<int> matchList = [];
  bool isAMatch = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('Users').get().then(
    (querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (result.data()["ID"] == userId) {
          matchList = result.data()["Matched"].cast<int>();
          if (matchList.contains(companyId)) {
            isAMatch = true;
          }
          break;
        }
      }
    },
  );
  return isAMatch;
}

// Returns true if the user is a match with the company
Future<bool> getCompanyMatchList(
    int companyId, int userId, List<String> conversationsIds) async {
  List<int> matchList = [];
  bool isAMatch = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  await db.collection('Companies').get().then(
    (querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (result.data()["ID"] == companyId) {
          debugPrint("${result.data()["Matched"]} $userId");
          matchList = result.data()["Matched"].cast<int>();
          if (matchList.contains(userId)) {
            isAMatch = true;
            break;
          }
        }
      }
    },
  );
  return isAMatch;
}

// Return the list of all users
Future<List<int>> getUsersList() async {
  List<int> usersList = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('Users').get().then(
    (querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (result.data()["ID"] != null && result.data()["ID"] != -1) {
          usersList.add(result.data()["ID"]);
        }
      }
    },
  );
  return usersList;
}

// Return the list of all companies
Future<List<int>> getCompaniesList() async {
  List<int> companiesList = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('Companies').get().then(
    (querySnapshot) {
      for (var result in querySnapshot.docs) {
        if (result.data()["ID"] != null && result.data()["ID"] != -1) {
          companiesList.add(result.data()["ID"]);
        }
      }
    },
  );
  return companiesList;
}

void createNewConversation(String names, int companyId, int candidateId) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('Conversations').add({
    'IDS': '$companyId:$candidateId',
    'Messages': ["Ceci est le début de votre conversation"],
    'MessagesW': [2],
    'Dates': [Timestamp.now()],
    'Names': names,
  });
}

Future<String> getNameFromId(int id, bool isCompany, bool isName) async {
  debugPrint('isCompany: $isCompany');
  String name = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  String collection = isCompany ? "Companies" : "Users";
  await db.collection(collection).get().then(
    (querySnapshot) {
      for (var result in querySnapshot.docs) {
        debugPrint('ID: ${result.data()["ID"]} - $id - isName: $isName');
        if (result.data()["ID"] == id) {
          if (isName) {
            debugPrint('Name: ${result.data()["Name"]}');
            return result.data()["Name"];
          } else {
            debugPrint('Pseudonyme: ${result.data()["Pseudonyme"]}');
            return result.data()["Pseudonyme"];
          }
        }
      }
    },
  ).then((value) => name = value);
  return name;
}
