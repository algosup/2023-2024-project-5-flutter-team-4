import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_matching_app/main.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage(
      {super.key,
      required this.names,
      required this.messages,
      required this.sender,
      required this.isCompany});

  final String names;
  final List<String> messages;
  final List<int> sender;
  final bool isCompany;

  @override
  State<ConversationPage> createState() => _ConversationPageState(
      names: names, messages: messages, sender: sender, isCompany: isCompany);
}

class _ConversationPageState extends State<ConversationPage>
    with WidgetsBindingObserver {
  var names;

  /// A list containing all messages of a conversation
  List<String> messages;

  /// A list mirroring the messages list to identify the sender
  List<int> sender;

  /// A boolean to identify which view the app is on: 0 is on candidate vew, 1 company view
  bool isCompany;
  _ConversationPageState(
      {required this.names,
      required this.messages,
      required this.sender,
      required this.isCompany});

  /// A gradiant for the background going from pink to purple
  final LinearGradient backgroundGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 215, 0, 123),
      Color.fromARGB(255, 169, 38, 135),
    ],
  );

  /// A boolean to identify if the keyboard is opened or not
  bool _isKeyboardVisible = false;

  /// The node to manage interactions with text fields
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0.0;
    });
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  final TextfieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      //----------------- APPBAR -----------------
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: backgroundGradient),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        //------------- PARTICIPANT NAME -------------
        title: Text(
          isCompany ? names.split(":")[1] : names.split(":")[0],
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Shanti',
          fontSize: 24,
        ),
        centerTitle: true,
      ),
      //----------------- MESSAGES -----------------
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                height: size.height - size.height * 0.18,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      for (int i = 0; i < messages.length; i++)
                        Container(
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            left: isCompany
                                ? sender[i] == 0
                                    ? 10.0
                                    : 70.0
                                : sender[i] == 1
                                    ? 10.0
                                    : 70.0,
                            right: isCompany
                                ? sender[i] == 1
                                    ? 10.0
                                    : 70.0
                                : sender[i] == 0
                                    ? 10.0
                                    : 70.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            minLeadingWidth: 0,
                            title: Text(
                              messages[i],
                              textAlign: sender[i] == 0
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Shanti',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              //---------------- TEXT FIELD ----------------
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.only(
                  bottom: _isKeyboardVisible
                      ? MediaQuery.of(context).viewPadding.bottom
                      : 0,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: const BoxDecoration(
                          border: null,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: TextFieldTapRegion(
                          onTapOutside: (PointerDownEvent) {
                            FocusScope.of(context).unfocus();
                          },
                          child: TextField(
                            controller: TextfieldController,
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontFamily: 'Shanti',
                                fontSize: 20,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),

                      //--------------- SEND BUTTON ----------------
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.2,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              updateMessagesOnDatabase(
                                  TextfieldController.text,
                                  isCompany,
                                  names.split(":")[0],
                                  names.split(":")[1]
                                  );
                              setState(() {
                                messages.add(TextfieldController.text);
                                sender.add(isCompany ? 1 : 0);
                                TextfieldController.clear();
                              });
                            },
                            icon: const Icon(Icons.send_rounded)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void updateMessagesOnDatabase(
    String message, bool isCompany, String companyId, String candidateId) {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<String> messages = [];
  List<int> sender = [];
  String id = "";

  db
      .collection("Conversations")
      .where('IDS', isEqualTo: "$companyId:$candidateId")
      .get()
      .then((value) => {
            if (value.docs[0].data()["Messages"] != null)
              {
                messages = List<String>.from(value.docs[0].data()["Messages"]),
                sender = List<int>.from(value.docs[0].data()["MessagesW"]),
                id = value.docs[0].id,
              }
          })
      .then((value) => {
            if (isCompany)
              {
                sender.add(1),
                messages.add(message),
              }
            else
              {
                sender.add(0),
                messages.add(message),
              }
          })
      .then((value) => FirebaseFirestore.instance
          .collection('Conversations')
          .doc(id)
          .update({"Messages": messages}))
      .then((value) => FirebaseFirestore.instance
          .collection('Conversations')
          .doc(id)
          .update({"MessagesW": sender}))
      .then((value) => FirebaseFirestore.instance
              .collection('Conversations')
              .doc(id)
              .update({
            "Dates": FieldValue.arrayUnion([Timestamp.now()])
          }));
}
