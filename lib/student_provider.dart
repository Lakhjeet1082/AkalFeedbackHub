class Student {
  final String auid;
  final String course;
  final String email;
  final String name;
  final int semester;
  final List<String> subjects;

  Student({
    required this.auid,
    required this.course,
    required this.email,
    required this.name,
    required this.semester,
    required this.subjects,
  });

  factory Student.fromMap(Map<dynamic, dynamic> map) {
    return Student(
      auid: map['Auid'] ?? '',
      course: map['course'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      semester: map['semester'] ?? 0,
      subjects: List<String>.from(map['subject'] ?? []),
    );
  }
}