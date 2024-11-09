import 'dart:developer';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:junction2024_thrive_connect/models.dart';

class DataController extends GetxController {
  List<CompanyValue> companyValues = [];
  List<Hobby> hobbies = [];
  List<Team> teams = [];
  List<JobOffer> jobOffers = [];
  List<Company> companies = [];
  List<JobSeeker> jobSeekers = [];
  List<Employee> employees = [];

  RxList<JobOffer> filteredJobOffers = <JobOffer>[].obs;

  JobOffer getJobOffersForTeam(int teamId) {
    return jobOffers
        .firstWhere((jobOffer) => jobOffer.teamId == teamId.toString());
  }

  Team getTeamFromJobOffer(JobOffer jobOffer) {
    return teams.firstWhere((team) => team.id == jobOffer.teamId);
  }

  Company getCompanyFromJobOffer(JobOffer jobOffer) {
    final team = getTeamFromJobOffer(jobOffer);
    return companies.firstWhere((company) => company.id == team.companyId);
  }

  CompanyValue getCompanyValue(String companyValueId) {
    return companyValues.firstWhere((companyValue) {
      return companyValue.id == companyValueId;
    });
  }

  List<Employee> getEmployeesFromTeam(Team team) {
    return employees.where((employee) {
      return employee.teamIds.contains(team.id);
    }).toList();
  }

  Hobby getHobby(String hobbyId) {
    return hobbies.firstWhere((hobby) => hobby.id == hobbyId);
  }

  CompanyValue getValues(String valueID) {
    return companyValues
        .firstWhere((companyValue) => companyValue.id == valueID);
  }

  void applyFilter(String text) {
    final filter = text.toLowerCase();

    if (filter.isEmpty) {
      filteredJobOffers.value = jobOffers;
    }

    final filteredOffers = jobOffers.where((jobOffer) {
      final team = getTeamFromJobOffer(jobOffer);
      final company = getCompanyFromJobOffer(jobOffer);
      final employees = getEmployeesFromTeam(team);
      final hobbies = employees
          .map((employee) =>
              employee.hobbyIds.map((hobbyId) => getHobby(hobbyId)).toList())
          .toList();

      return team.name.toLowerCase().contains(filter) ||
          company.name.toLowerCase().contains(filter) ||
          jobOffer.title.toLowerCase().contains(filter) ||
          jobOffer.description.toLowerCase().contains(filter) ||
          hobbies.any((hobby) =>
              hobby.any((hobby) => hobby.name.toLowerCase().contains(filter)));
    }).toList();

    if (filteredOffers.isEmpty) {
      filteredJobOffers.value = jobOffers;
    } else {
      filteredJobOffers.value = filteredOffers;
    }
  }

  Future<void> loadData() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');

      final data = json.decode(response);

      companyValues = (data['CompanyValues'] as List)
          .map((json) => CompanyValue.fromJson(json))
          .toList();
      hobbies = (data['Hobbies'] as List)
          .map((json) => Hobby.fromJson(json))
          .toList();
      teams =
          (data['Teams'] as List).map((json) => Team.fromJson(json)).toList();
      jobOffers = (data['JobOffer'] as List)
          .map((json) => JobOffer.fromJson(json))
          .toList();
      companies = (data['Company'] as List)
          .map((json) => Company.fromJson(json))
          .toList();
      jobSeekers = (data['JobSeeker'] as List)
          .map((json) => JobSeeker.fromJson(json))
          .toList();
      employees = (data['Employee'] as List)
          .map((json) => Employee.fromJson(json))
          .toList();
      log("Data loaded successfully");

      filteredJobOffers.value = jobOffers;
    } catch (e) {
      log("Error loading data: $e");
    }
  }
}
