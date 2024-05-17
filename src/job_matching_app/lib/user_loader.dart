//--------------------------- IMPORTS --------------------------
import 'dart:convert';

//--------------------------- FLUTTER --------------------------
import 'package:flutter/services.dart';

//------------------------- USER PARSER -------------------------
Future<int> getUser(String email, String password) async {
  final String jsonString =
      await rootBundle.loadString('lib/assets/json/users.json');
  var data = jsonDecode(jsonString);
  // Parse user data
  var userJson = data['users'];

  var userInfo = userJson.firstWhere(
    (user) =>
        user['email'].toLowerCase() == email.toLowerCase() &&
        user['password'].toLowerCase() == password.toLowerCase(),
    orElse: () => 0,
  );
  if (userInfo == 0) {
    return userInfo;
  }
  // Get the softskills list
  List<List<int>> softSkills = userInfo['softSkills'].map<List<int>>((skills) {
    return List<int>.from(skills);
  }).toList();

  // Get the chart list
  List<int> chart = userInfo['chart']
      .map((chart) => int.tryParse(chart.toString()))
      .where((parsedValue) => parsedValue != null)
      .cast<int>()
      .toList();

  // Initialize the User instance
  User.initialize(
    email: userInfo['email'].toString(),
    password: userInfo['password'].toString(),
    softSkills: softSkills,
    chart: chart,
  );
  return 1;
}

//---------------------------- USER ---------------------------
class User {
  final String email;
  final String password;
  final List<List<int>> softSkills;
  final List<int> chart;

  static User? _instance;

  User(
      {required this.email,
      required this.password,
      required this.softSkills,
      required this.chart});

  static User getInstance() {
    if (_instance == null) {
      throw Exception("User not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  static void initialize({
    required String email,
    required String password,
    required List<List<int>> softSkills,
    required List<int> chart,
  }) {
    if (_instance != null) {
      throw Exception("User already initialized.");
    }
    _instance = User(
      email: email,
      password: password,
      softSkills: softSkills,
      chart: chart,
    );
  }
}
