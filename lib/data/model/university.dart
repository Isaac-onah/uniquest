class University {
  final String id;
  final String name;
  final String shortName;
  final int establishedYear;
  final String country;
  final String city;
  final String type; // 'public' or 'private'
  final String accreditation;
  final String description;
  final String logoUrl;
  final String website;
  final int globalRanking;
  final int nationalRanking;
  final int studentPopulation;
  final double internationalRatio;
  final DateTime admissionDeadline;
  final DateTime createdAt;
  // final List<Faculty> faculties;

  University({
    required this.id,
    required this.name,
    required this.shortName,
    required this.establishedYear,
    required this.country,
    required this.city,
    required this.type,
    required this.accreditation,
    required this.description,
    required this.logoUrl,
    required this.website,
    required this.globalRanking,
    required this.nationalRanking,
    required this.studentPopulation,
    required this.internationalRatio,
    required this.admissionDeadline,
    required this.createdAt,
    // required this.faculties,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      name: json['name'],
      shortName: json['short_name'],
      establishedYear: json['established_year'],
      country: json['country'],
      city: json['city'],
      type: json['type'],
      accreditation: json['accreditation'],
      description: json['description'],
      logoUrl: json['logo_url'],
      website: json['website'],
      globalRanking: json['global_ranking'],
      nationalRanking: json['national_ranking'],
      studentPopulation: json['student_population'],
      internationalRatio: json['international_ratio']?.toDouble(),
      admissionDeadline: json['admission_deadline'] != null
          ? DateTime.parse(json['admission_deadline'])
          : DateTime.now(),
      createdAt: DateTime.parse(json['created_at']),
      // faculties: json['faculties'] != null
      //     ? (json['faculties'] as List)
      //     .map((i) => Faculty.fromJson(i))
      //     .toList()
      //     : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_name': shortName,
      'established_year': establishedYear,
      'country': country,
      'city': city,
      'type': type,
      'accreditation': accreditation,
      'description': description,
      'logo_url': logoUrl,
      'website': website,
      'global_ranking': globalRanking,
      'national_ranking': nationalRanking,
      'student_population': studentPopulation,
      'international_ratio': internationalRatio,
      'admission_deadline': admissionDeadline.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      // 'faculties': faculties?.map((f) => f.toJson()).toList(),
    };
  }
}

class Faculty {
  final String id;
  final String universityId;
  final String name;
  final String dean;
  final String website;
  final DateTime createdAt;
  final List<Department>? departments;

  Faculty({
    required this.id,
    required this.universityId,
    required this.name,
    required this.dean,
    required this.website,
    required this.createdAt,
    required this.departments,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) {
    return Faculty(
      id: json['id'],
      universityId: json['university_id'],
      name: json['name'],
      dean: json['dean'],
      website: json['website'],
      createdAt: DateTime.parse(json['created_at']),
      departments: json['departments'] != null
          ? (json['departments'] as List)
          .map((i) => Department.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'university_id': universityId,
      'name': name,
      'dean': dean,
      'website': website,
      'created_at': createdAt.toIso8601String(),
      'departments': departments?.map((d) => d.toJson()).toList(),
    };
  }
}

class Department {
  final String id;
  final String facultyId;
  final String name;
  final String? headOfDepartment;
  final String? website;
  final DateTime createdAt;
  final List<Program>? programs;

  Department({
    required this.id,
    required this.facultyId,
    required this.name,
    this.headOfDepartment,
    this.website,
    required this.createdAt,
    this.programs,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      facultyId: json['faculty_id'],
      name: json['name'],
      headOfDepartment: json['head_of_department'],
      website: json['website'],
      createdAt: DateTime.parse(json['created_at']),
      programs: json['programs'] != null
          ? (json['programs'] as List)
          .map((i) => Program.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'faculty_id': facultyId,
      'name': name,
      'head_of_department': headOfDepartment,
      'website': website,
      'created_at': createdAt.toIso8601String(),
      'programs': programs?.map((p) => p.toJson()).toList(),
    };
  }
}

class Program {
  final String id;
  final String universityId;
  final String? facultyId;
  final String? departmentId;
  final String name;
  final String level; // 'undergraduate', 'postgraduate', 'phd'
  final String? degreeType;
  final int? durationYears;
  final String mode; // 'full-time', 'part-time', 'online', 'hybrid'
  final String? language;
  final double? tuitionFee;
  final double? tuitionFeeInternational;
  final double? applicationFee;
  final bool? scholarshipsAvailable;
  final List<String>? startDates;
  final String? admissionRequirements;
  final List<String>? prerequisiteSubjects;
  final int? intakeCapacity;
  final String? description;
  final String? careerOpportunities;
  final String? website;
  final String? accreditation;
  final DateTime createdAt;

  Program({
    required this.id,
    required this.universityId,
    this.facultyId,
    this.departmentId,
    required this.name,
    required this.level,
    this.degreeType,
    this.durationYears,
    required this.mode,
    this.language,
    this.tuitionFee,
    this.tuitionFeeInternational,
    this.applicationFee,
    this.scholarshipsAvailable,
    this.startDates,
    this.admissionRequirements,
    this.prerequisiteSubjects,
    this.intakeCapacity,
    this.description,
    this.careerOpportunities,
    this.website,
    this.accreditation,
    required this.createdAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      universityId: json['university_id'],
      facultyId: json['faculty_id'],
      departmentId: json['department_id'],
      name: json['name'],
      level: json['level'],
      degreeType: json['degree_type'],
      durationYears: json['duration_years'],
      mode: json['mode'],
      language: json['language'],
      tuitionFee: json['tuition_fee']?.toDouble(),
      tuitionFeeInternational: json['tuition_fee_international']?.toDouble(),
      applicationFee: json['application_fee']?.toDouble(),
      scholarshipsAvailable: json['scholarships_available'],
      startDates: json['start_dates'] != null
          ? List<String>.from(json['start_dates'])
          : null,
      admissionRequirements: json['admission_requirements'],
      prerequisiteSubjects: json['prerequisite_subjects'] != null
          ? List<String>.from(json['prerequisite_subjects'])
          : null,
      intakeCapacity: json['intake_capacity'],
      description: json['description'],
      careerOpportunities: json['career_opportunities'],
      website: json['website'],
      accreditation: json['accreditation'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'university_id': universityId,
      'faculty_id': facultyId,
      'department_id': departmentId,
      'name': name,
      'level': level,
      'degree_type': degreeType,
      'duration_years': durationYears,
      'mode': mode,
      'language': language,
      'tuition_fee': tuitionFee,
      'tuition_fee_international': tuitionFeeInternational,
      'application_fee': applicationFee,
      'scholarships_available': scholarshipsAvailable,
      'start_dates': startDates,
      'admission_requirements': admissionRequirements,
      'prerequisite_subjects': prerequisiteSubjects,
      'intake_capacity': intakeCapacity,
      'description': description,
      'career_opportunities': careerOpportunities,
      'website': website,
      'accreditation': accreditation,
      'created_at': createdAt.toIso8601String(),
    };
  }
}