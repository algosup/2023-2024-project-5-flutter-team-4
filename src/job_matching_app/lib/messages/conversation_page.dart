import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage(
      {super.key,
      required this.convId,
      required this.conversation,
      required this.companies});

  final int convId;

  final List<String> conversation;

  final List<int> companies;

  @override
  State<ConversationPage> createState() => _ConversationPageState(
      id: convId, conversation: conversation, companies: companies);
}

class _ConversationPageState extends State<ConversationPage> {
  var id;
  List<String> conversation;
  List<int> companies;

  _ConversationPageState(
      {required this.id, required this.conversation, required this.companies});

  final LinearGradient backgroundGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 215, 0, 123),
      Color.fromARGB(255, 169, 38, 135),
    ],
  );

  final LinearGradient itemGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Colors.grey.shade300,
      Colors.grey.shade500,
      Colors.black,
    ],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          conversation[0],
        ),
        titleTextStyle: const TextStyle(
          // color: Colors.white,
          fontFamily: 'Shanti',
          fontSize: 24,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.921,
              child: ListView(
                children: [
                  // Text('Conversation $id'),
                  for (int i = 1; i < conversation.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: companies[i] == 0 ? 10.0 : 70.0,
                        right: companies[i] == 1 ? 10.0 : 70.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          textAlign: companies[i] == 0
                              ? TextAlign.start
                              : TextAlign.end,
                          conversation[i],
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
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.921,
              ),
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
                        onPressed: () {}, icon: const Icon(Icons.send_rounded)),
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
