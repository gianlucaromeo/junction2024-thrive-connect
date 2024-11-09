import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:junction2024_thrive_connect/models.dart';

class DataController extends GetxController {
  List<CompanyValue> values = [];
  List<Hobby> hobbies = [];
  List<Team> teams = [];
  List<JobOffer> jobOffers = [];
  List<Company> companies = [];
  List<JobSeeker> jobSeekers = [];
  List<Employee> employees = [];

  @override
  void onInit() async {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);

    values = (data['values'] as List)
        .map((json) => CompanyValue.fromJson(json))
        .toList();
    hobbies =
        (data['hobbies'] as List).map((json) => Hobby.fromJson(json)).toList();
    teams = (data['teams'] as List).map((json) => Team.fromJson(json)).toList();
    jobOffers = (data['jobOffers'] as List)
        .map((json) => JobOffer.fromJson(json))
        .toList();
    companies = (data['companies'] as List)
        .map((json) => Company.fromJson(json))
        .toList();
    jobSeekers = (data['jobSeekers'] as List)
        .map((json) => JobSeeker.fromJson(json))
        .toList();
    employees = (data['employees'] as List)
        .map((json) => Employee.fromJson(json))
        .toList();
  }
}
