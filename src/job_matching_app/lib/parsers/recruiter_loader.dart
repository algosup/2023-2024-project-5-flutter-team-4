//--------------------------- IMPORTS --------------------------
import 'dart:convert';

//--------------------------- FLUTTER --------------------------
import 'package:flutter/services.dart';

//---------------------- RECRUITER PARSER ----------------------
Future<int> getRecruiter(String email, String password) async {
  final String jsonString =
      await rootBundle.loadString('lib/assets/json/recruiters.json');
  var data = jsonDecode(jsonString);
  // Parse Recruiter data
  var recruiterJson = data['recruiters'];

  var recruiterInfo = recruiterJson.firstWhere(
    (recruiter) =>
        recruiter['email'].toLowerCase() == email.toLowerCase() &&
        recruiter['password'].toLowerCase() == password.toLowerCase(),
    orElse: () => 0,
  );
  if (recruiterInfo == 0) {
    return recruiterInfo;
  }
  // Get the softskills list
  List<List<int>> softSkills =
      recruiterInfo['softSkills'].map<List<int>>((skills) {
    return List<int>.from(skills);
  }).toList();

  // Get the chart list
  List<int> chart = recruiterInfo['chart']
      .map((chart) => int.tryParse(chart.toString()))
      .where((parsedValue) => parsedValue != null)
      .cast<int>()
      .toList();

  // Initialize the Recruiter instance
  Recruiter.initialize(
    email: recruiterInfo['email'].toString(),
    password: recruiterInfo['password'].toString(),
    softSkills: softSkills,
    chart: chart,
  );
  return 1;
}

//-------------------------- RECRUITER ------------------------
class Recruiter {
  final String email;
  final String password;
  final List<List<int>> softSkills;
  final List<int> chart;

  static Recruiter? _instance;

  Recruiter(
      {required this.email,
      required this.password,
      required this.softSkills,
      required this.chart});

  static Recruiter getInstance() {
    if (_instance == null) {
      throw Exception("Recruiter not initialized. Call initialize() first.");
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
      throw Exception("Recruiter already initialized.");
    }
    _instance = Recruiter(
      email: email,
      password: password,
      softSkills: softSkills,
      chart: chart,
    );
  }
}
