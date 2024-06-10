import 'package:flutter/material.dart';

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

class _ConversationPageState extends State<ConversationPage>
    with WidgetsBindingObserver {
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

  bool _isKeyboardVisible = false;
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
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0.0;
    });
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

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
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.only(
                bottom: _isKeyboardVisible
                    ? MediaQuery.of(context).viewInsets.bottom
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
                          onPressed: () {},
                          icon: const Icon(Icons.send_rounded)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
