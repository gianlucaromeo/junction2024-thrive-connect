class CompanyValue {
  final String id;
  final String name;

  CompanyValue({
    required this.id,
    required this.name,
  });

  factory CompanyValue.fromJson(Map<String, dynamic> json) => CompanyValue(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Hobby {
  final String id;
  final String name;

  Hobby({
    required this.id,
    required this.name,
  });

  factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Team {
  final String id;
  final String name;
  final String companyId;
  final String img;
  final String description;

  Team({
    required this.id,
    required this.name,
    required this.companyId,
    required this.img,
    required this.description,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        companyId: json['companyId'],
        img: json['img'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'companyId': companyId,
        'img': img,
        'description': description,
      };
}

class JobOffer {
  final String id;
  final String title;
  final String location;
  final String language;
  final String description;
  final String teamId;

  JobOffer({
    required this.id,
    required this.title,
    required this.location,
    required this.language,
    required this.description,
    required this.teamId,
  });

  factory JobOffer.fromJson(Map<String, dynamic> json) => JobOffer(
        id: json['id'],
        title: json['title'],
        location: json['location'],
        language: json['language'],
        description: json['description'],
        teamId: json['teamId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'location': location,
        'language': language,
        'description': description,
        'teamId': teamId,
      };
}

class Company {
  final String id;
  final String name;
  final String description;
  final List<String> valueIds;

  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.valueIds,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        valueIds: List<String>.from(json['valueIds'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'valueIds': valueIds,
      };
}

class Employee {
  final String id;
  final String status;
  final String email;
  final String firstName;
  final String lastName;
  final List<String> hobbyIds;
  final List<String> valueIds;
  final List<String> teamIds;
  final String role;
  final String workStyle;
  final String img;

  Employee({
    required this.id,
    required this.status,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.hobbyIds,
    required this.valueIds,
    required this.teamIds,
    required this.workStyle,
    required this.role,
    required this.img,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json['id'],
        status: json['status'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        hobbyIds: List<String>.from(json['hobbyIds'] ?? []),
        valueIds: List<String>.from(json['valueIds'] ?? []),
        teamIds: List<String>.from(json['teamIds'] ?? []),
        workStyle: json['workStyle'],
        role: json['role'],
        img: json['img'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'hobbyIds': hobbyIds,
        'valueIds': valueIds,
        'teamIds': teamIds,
        'workStyle': workStyle,
        'role': role,
        'img': img,
      };
}

class JobSeeker {
  final String id;
  final String status;
  final String email;
  final String firstName;
  final String lastName;
  final List<String> hobbyIds;
  final List<String> valueIds;
  final List<String> likedTeamIds;
  final List<String> likedCompanyIds;
  final String workStyle;
  final String role;
  final String img;

  JobSeeker({
    required this.id,
    required this.status,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.hobbyIds,
    required this.valueIds,
    required this.likedTeamIds,
    required this.likedCompanyIds,
    required this.workStyle,
    required this.role,
    required this.img,
  });

  factory JobSeeker.fromJson(Map<String, dynamic> json) => JobSeeker(
        id: json['id'],
        status: json['status'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        hobbyIds: List<String>.from(json['hobbyIds'] ?? []),
        valueIds: List<String>.from(json['valueIds'] ?? []),
        likedTeamIds: List<String>.from(json['likedTeamIds'] ?? []),
        likedCompanyIds: List<String>.from(json['likedCompanyIds'] ?? []),
        workStyle: json['workStyle'],
        role: json['role'],
        img: json['img'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'hobbyIds': hobbyIds,
        'valueIds': valueIds,
        'likedTeamIds': likedTeamIds,
        'likedCompanyIds': likedCompanyIds,
        'workStyle': workStyle,
        'role': role,
        'img': img,
      };
}

class Favorites {
  final List<String> jobOfferIds;

  Favorites({
    required this.jobOfferIds,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        jobOfferIds: List<String>.from(json['jobOfferIds'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'jobOfferIds': jobOfferIds,
      };
}
