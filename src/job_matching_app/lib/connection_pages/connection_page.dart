//-------------------------- FLUTTER --------------------------
import 'package:flutter/material.dart';
import 'package:job_matching_app/connection_pages/candidate_form.dart';
import 'package:job_matching_app/connection_pages/recruiter_form.dart';

//---------------------- CONNECTION PAGE ----------------------
class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

//---------------------- CONNECTION STATE ---------------------
class _ConnectionPageState extends State<ConnectionPage> {
  List<Widget> pages = [
    CandidateFormPage(),
    RecruiterFormPage(),
  ];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!
        .copyWith(color: theme.colorScheme.onPrimary, fontSize: 28);
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: currentIndex != -1
            ? IconButton(
                icon:  Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: mediaQuery.width*0.1,
                ), // Icon for the back arrow
                onPressed: () {
                  setState(() {
                    currentIndex = -1;
                  });
                },
              )
            : null,
      ),
      body: currentIndex == -1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: mediaQuery.width * 0.5,
                    height: mediaQuery.height * 0.05,
                    child: Card(
                      color: theme.colorScheme.secondary,
                      child: Center(
                        child: Text(
                          "You are a",
                          textAlign: TextAlign.center,
                          style: style,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.05,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.5,
                    height: mediaQuery.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary),
                      child: Center(
                        child: Text(
                          "Candidate",
                          textAlign: TextAlign.center,
                          style: style,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.5,
                    height: mediaQuery.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary),
                      child: Center(
                        child: Text(
                          "Recruiter",
                          textAlign: TextAlign.center,
                          style: style,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : pages[currentIndex],
    );
  }
}
