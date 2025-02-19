class University {
  final String universityId;
  final String universityName;
  final String email;
  final double rating;
  final String location;
  final String city;
  final String country;
  final String history;
  final String image;
  final int admissionFee;
  final List<Department> departments;

  University({
    required this.universityId,
    required this.universityName,
    required this.email,
    required this.rating,
    required this.location,
    required this.city,
    required this.country,
    required this.history,
    required this.image,
    required this.admissionFee,
    required this.departments,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    var departmentList = json['departments'] as List;
    List<Department> departments =
    departmentList.map((i) => Department.fromJson(i)).toList();

    return University(
      universityId: json['university_id'],
      universityName: json['university_name'],
      email: json['email'],
      rating: json['rating'].toDouble(),
      location: json['location'],
      city: json['city'],
      country: json['country'],
      history: json['history'],
      image: json['image'],
      admissionFee: json['admission_fee'],
      departments: departments,
    );
  }
}

class Department {
  final String departmentId;
  final String departmentName;
  final List<Course> courses;

  Department({
    required this.departmentId,
    required this.departmentName,
    required this.courses,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List;
    List<Course> courses = courseList.map((i) => Course.fromJson(i)).toList();

    return Department(
      departmentId: json['department_id'],
      departmentName: json['department_name'],
      courses: courses,
    );
  }
}
class Course {
  final String courseName;
  final String mode;
  final String campus;
  final int duration;
  final int tuitionFee;
  final List<Subject> subjects;

  Course({
    required this.courseName,
    required this.mode,
    required this.campus,
    required this.duration,
    required this.tuitionFee,
    required this.subjects,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    var subjectList = json['subjects'] as List;
    List<Subject> subjects = subjectList.map((i) => Subject.fromJson(i)).toList();

    return Course(
      courseName: json['course_name'],
      campus: json['campus'],
      duration: json['duration'],
      mode: json['mode'],
      tuitionFee: json['tuition_fee'],
      subjects: subjects,
    );
  }
}
class Subject {
  final String subjectId;
  final String subjectName;
  final String preRequisites;

  Subject({
    required this.subjectId,
    required this.subjectName,
    required this.preRequisites,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
      preRequisites: json['pre_requisites'],
    );
  }
}
