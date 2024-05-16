//--------------------------- IMPORTS --------------------------
import 'dart:convert';

//--------------------------- FLUTTER --------------------------
import 'package:flutter/services.dart';

//------------------------- USER PARSER -------------------------
Future<void> loadUser() async {
  final String jsonString =
      await rootBundle.loadString('lib/assets/json/user.json');
  var data = jsonDecode(jsonString);
  // Parse user data
  var userJson = data['user'];
  // Get the softskills list
  List<dynamic> softSkillsJson = userJson['softSkills'];
  List<List<int>> softSkills = softSkillsJson.map<List<int>>((skills) {
    return List<int>.from(skills);
  }).toList();

  // Initialize the User instance
  User.initialize(
    firstname: userJson['firstname'] ?? '',
    lastName: userJson['lastname'] ?? '',
    email: userJson['email'] ?? '',
    softSkills: softSkills,
  );
}

class User {
  final String firstname;
  final String lastName;
  final String email;
  final List<List<int>> softSkills;

  static User? _instance;

  User(
      {required this.firstname,
      required this.lastName,
      required this.email,
      required this.softSkills});

  static User getInstance() {
    if (_instance == null) {
      throw Exception("User not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  static void initialize({
    required String firstname,
    required String lastName,
    required String email,
    required List<List<int>> softSkills,
  }) {
    if (_instance != null) {
      throw Exception("User already initialized.");
    }
    _instance = User(
      firstname: firstname,
      lastName: lastName,
      email: email,
      softSkills: softSkills,
    );
  }
}
