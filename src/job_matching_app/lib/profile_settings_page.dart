import 'package:flutter/material.dart';
import 'package:job_matching_app/more_settings_page.dart';
import 'package:job_matching_app/chat_gpt/chat_screen.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MoreSettingsPage(),
                  ),
                );
              },
              child: const Icon(Icons.settings_suggest_rounded, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ChatPage(),
                  ),
                );
              },
              child: const Text('Go to Chat GPT Screen', style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
