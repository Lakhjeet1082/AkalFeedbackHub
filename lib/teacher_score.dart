import 'package:cloud_firestore/cloud_firestore.dart';
import 'feedback_utlis.dart'; // Import FeedbackUtils class

class DatabaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> calculateAndStoreTeacherSubjectAverages() async {
  try {
    // Get Students' Subjects
    var studentsSubjectsSnapshot =
        await FirebaseFirestore.instance.collection('Students').get();

    // Get Teachers' Subjects
    var teachersSnapshot =
        await FirebaseFirestore.instance.collection('Teachers').get();

    for (var teacherDoc in teachersSnapshot.docs) {
      var teacherName = teacherDoc.id;
      var teacherSubjects = teacherDoc.data()['subjects'];

      Map<String, double> subjectAverages = {};

      // Iterate through teacher's subjects
      for (var subject in teacherSubjects.keys) {
        var studentsFeedback = studentsSubjectsSnapshot.docs
            .where((studentDoc) =>
                studentDoc.data()['subject'].contains(subject))
            .toList();

        if (studentsFeedback.isNotEmpty) {
          double averageFeedback =
              await FeedbackUtils.calculateSubjectAverage(studentsFeedback);
          subjectAverages[subject] = averageFeedback;
        }
      }

      // Store the subject averages in Teacher-Score collection under teacher's name
      await FirebaseFirestore.instance
          .collection('Teacher-Score')
          .doc(teacherName) // Using teacher's name as document ID
          .set({'Subjects': subjectAverages});
    }

    print('Teacher subject averages stored in Teacher-Score collection!');
  } catch (e) {
    print('Error storing teacher subject averages: $e');
  }
}

}
