import 'package:flutter/material.dart';
import 'package:job_matching_app/settings/more_settings_page.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;
  bool isCompanyView = false;
  String Title = "";

  
  @override
  void initState() {
    super.initState();
    getSharedPreferences('isCompanyView').then((value) {
      isCompanyView = value;
      if (value){
        Title = "Company Profile Settings";
      }
      else {
        Title = "Candidate Profile Settings";
      }
    }).then((value) => setState(() {
      
    }));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text(Title,
            style: const TextStyle(
              color: Colors.black,
            )),
      ),
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
          ],
        ),
      ),
    );
  }
}
