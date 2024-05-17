import 'package:flutter/material.dart';
import 'package:job_matching_app/main.dart';
import 'package:job_matching_app/parsers/recruiter_loader.dart';

class RecruiterFormPage extends StatefulWidget {
  @override
  State<RecruiterFormPage> createState() => _RecruiterFormState();
}

//---------------------- CONNECTION STATE ---------------------
class _RecruiterFormState extends State<RecruiterFormPage> {
  _RecruiterFormState();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool error = false;
  String emailError = "Enter a valid email";
  String passwordError = "Password incorrect";
  var emailColor = Colors.black;
  var passwordColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //----------------- EMAIL -----------------
            SizedBox(
              width: mediaQuery.width * 0.7,
              child: TextField(
                controller: emailController,
                onTap: () {
                  error = false;
                  emailColor = Colors.black;
                },
                decoration: InputDecoration(
                  hintText: emailColor == Colors.black ? "" : emailError,
                  hintStyle: TextStyle(color: emailColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: const UnderlineInputBorder(),
                  label: const Text("Enter your email"),
                ),
              ),
            ),

            //---------------- PASSWORD ---------------
            SizedBox(
              width: mediaQuery.width * 0.7,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                onTap: () {
                  error = false;
                  passwordColor = Colors.black;
                },
                decoration: InputDecoration(
                  hintText: passwordColor == Colors.black ? "" : passwordError,
                  hintStyle: TextStyle(color: passwordColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: const UnderlineInputBorder(),
                  label: const Text("Enter your password"),
                ),
              ),
            ),
            //------------------ SPACE ----------------
            SizedBox(
              height: mediaQuery.height * 0.05,
              child: Center(
                child: Visibility(
                  visible: error,
                  child: const Text(
                    "Incorrect email or password",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            FloatingActionButton.extended(
              onPressed: () async {
                const pattern =
                    r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                final regex = RegExp(pattern);

                var invalidEmail = emailController.text.isEmpty ||
                    !regex.hasMatch(emailController.text);

                if (invalidEmail) {
                  setState(() {
                    emailColor = Colors.red;
                  });
                } else if (passwordController.text.isEmpty) {
                  setState(() {
                    passwordColor = Colors.red;
                  });
                } else {
                  int result = await getRecruiter(
                      emailController.text, passwordController.text);

                  if (result == 0) {
                    setState(() {
                      error = true;
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RootPage()),
                    );
                  }
                }
              },
              //------------- CONNECT BUTTON ------------
              label: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
