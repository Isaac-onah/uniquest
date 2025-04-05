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
  final List<Faculty> faculties;
  final List<Contact> contact;
  final List<Campus> campus;

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
    required this.faculties,
    required this.contact,
    required this.campus,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    print('Raw JSONvv: ${json.toString()}'); // Before parsing
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
      faculties: json['faculties'] != null
          ? (json['faculties'] as List)
          .map((i) => Faculty.fromJson(i))
          .toList()
          : [],
      contact:  json['contacts'] != null
          ? (json['contacts'] as List)
          .map((i) => Contact.fromJson(i))
          .toList()
          : [],
      campus: json['campuses'] != null
          ? (json['campuses'] as List)
          .map((i) => Campus.fromJson(i))
          .toList()
          : [],
    );
  }

}

class Faculty {
  final String id;
  final String universityId;
  final String name;
  final String dean;
  final String website;
  final DateTime createdAt;
  final List<Department> departments;

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
    print('Raw JSON: ${json.toString()}'); // Before parsing
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
          : [],
    );
  }
}

class Department {
  final String id;
  final String facultyId;
  final String name;
  final String headOfDepartment;
  final String website;
  final DateTime createdAt;
  final List<Program> programs;

  Department({
    required this.id,
    required this.facultyId,
    required this.name,
    required this.headOfDepartment,
    required this.website,
    required this.createdAt,
    required this.programs,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    print('Raw JSON: ${json.toString()}'); // Before parsing
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
          : [],
    );
  }

}

class Program {
  final String id;
  final String universityId;
  final String facultyId;
  final String departmentId;
  final String name;
  final String level; // 'undergraduate', 'postgraduate', 'phd'
  final String degreeType;
  final int durationYears;
  final String mode; // 'full-time', 'part-time', 'online', 'hybrid'
  final String language;
  final double tuitionFee;
  final double tuitionFeeInternational;
  final double applicationFee;
  final bool scholarshipsAvailable;
  final String startDates;
  final List<AdmissionRequirements> admissionRequirements;
  final String prerequisiteSubjects;
  final int intakeCapacity;
  final String description;
  final String careerOpportunities;
  final String website;
  final String accreditation;
  final DateTime createdAt;

  Program({
    required this.id,
    required this.universityId,
    required this.facultyId,
    required this.departmentId,
    required this.name,
    required this.level,
    required this.degreeType,
    required this.durationYears,
    required this.mode,
    required this.language,
    required this.tuitionFee,
    required this.tuitionFeeInternational,
    required this.applicationFee,
    required this.scholarshipsAvailable,
    required this.startDates,
    required this.admissionRequirements,
    required this.prerequisiteSubjects,
    required this.intakeCapacity,
    required this.description,
    required this.careerOpportunities,
    required this.website,
    required this.accreditation,
    required this.createdAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    print('Raw hj JSON: ${json.toString()}'); // Before parsing
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
      tuitionFee: json['tuition_fee'].toDouble(),
      tuitionFeeInternational: json['tuition_fee_international'].toDouble(),
      applicationFee: json['application_fee'].toDouble(),
      scholarshipsAvailable: json['scholarships_available'],
      startDates: json['start_dates'],
      admissionRequirements: json['admission_requirements'] != null
          ? (json['admission_requirements'] as List)
          .map((i) => AdmissionRequirements.fromJson(i))
          .toList()
          : [],
      prerequisiteSubjects: json['prerequisite_subjects'],
      intakeCapacity: json['intake_capacity'],
      description: json['description'],
      careerOpportunities: json['career_opportunities'],
      website: json['website'],
      accreditation: json['accreditation'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class AdmissionRequirements {
  final String id;
  final String programId;
  final String? universityId; // Optional, for requirements at university level
  final String requirementType; // e.g., 'academic', 'language', 'document'
  final String title;
  final String description;
  final bool isMandatory;
  final String? minScore; // For score-based requirements (e.g., GPA, test scores)
  final String? maxScore;
  final List<String>? acceptableDocuments; // For document requirements
  final String? languageTest; // For language requirements (e.g., 'IELTS', 'TOEFL')
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  AdmissionRequirements({
    required this.id,
    required this.programId,
    this.universityId,
    required this.requirementType,
    required this.title,
    required this.description,
    required this.isMandatory,
    this.minScore,
    this.maxScore,
    this.acceptableDocuments,
    this.languageTest,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  factory AdmissionRequirements.fromJson(Map<String, dynamic> json) {
    // Helper to safely parse lists
    List<String>? parseStringList(dynamic value) {
      if (value == null) return null;
      if (value is List) {
        return value.map((e) => e.toString()).toList();
      }
      return [value.toString()];
    }

    return AdmissionRequirements(
      id: json['id']?.toString() ?? '',
      programId: json['program_id']?.toString() ?? '',
      universityId: json['university_id']?.toString(),
      requirementType: json['requirement_type']?.toString() ?? 'academic',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isMandatory: json['is_mandatory'] as bool? ?? true,
      minScore: json['min_score']?.toString(),
      maxScore: json['max_score']?.toString(),
      acceptableDocuments: parseStringList(json['acceptable_documents']),
      languageTest: json['language_test']?.toString(),
      notes: json['notes']?.toString(),
      createdAt: DateTime.parse(json['created_at']?.toString() ?? DateTime.now().toString()),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
    );
  }
  // Helper method to display requirement in UI
  String get displayText {
    final buffer = StringBuffer();
    buffer.writeln(title);
    if (description.isNotEmpty) buffer.writeln(description);

    if (minScore != null || maxScore != null) {
      buffer.write('Score: ');
      if (minScore != null) buffer.write('min $minScore');
      if (maxScore != null) buffer.write(' - max $maxScore');
      buffer.writeln();
    }

    if (languageTest != null) {
      buffer.writeln('Language test: $languageTest');
    }

    if (acceptableDocuments?.isNotEmpty ?? false) {
      buffer.writeln('Required documents: ${acceptableDocuments!.join(', ')}');
    }

    if (notes?.isNotEmpty ?? false) {
      buffer.writeln('Notes: $notes');
    }

    return buffer.toString();
  }
}

class Contact {
  final String id;
  final String universityId;
  final String office;
  final String contactName;
  final String email;
  final String phone;
  final String address;
  final String officeHours;
  final DateTime createdAt;

  Contact({
    required this.id,
    required this.universityId,
    required this.office,
    required this.contactName,
    required this.email,
    required this.phone,
    required this.address,
    required this.officeHours,
    required this.createdAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      universityId: json['university_id'],
      office: json['office'],
      contactName: json['contact_name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      officeHours: json['office_hours'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

}


class Campus {
  final String id;
  final String universityId;
  final String name;
  final String address;
  final String city;
  final String country;
  final double latitude;
  final double longitude;
  final String facilities;
  final bool accommodationAvailable;
  final DateTime createdAt;

  Campus({
    required this.id,
    required this.universityId,
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.facilities,
    required this.accommodationAvailable,
    required this.createdAt,
  });

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      id: json['id'],
      universityId: json['university_id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      facilities: json['facilities'] ?? '',
      accommodationAvailable: json['accommodation_available'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }


}
