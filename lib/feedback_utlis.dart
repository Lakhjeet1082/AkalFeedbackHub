import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackUtils {
  static Future<double> calculateSubjectAverage(List<DocumentSnapshot> studentsFeedback) async {
  List<List<int?>> allResponses = studentsFeedback.map((doc) {
  final data = doc.data();
  if (data is Map && data.containsKey('responses')) {
    final responses = data['responses'] as List<dynamic>;
    if (responses.isNotEmpty) {
      return responses.cast<int?>().toList();
    }
  }
  // Return an empty list if 'responses' is not found or empty
  return <int>[];
}).toList();

  // Calculate the average of all responses for each question
  List<double> averageResponses = List.generate(
    allResponses.isNotEmpty ? allResponses[0].length : 0,
    (index) {
      int total = 0;
      int count = 0;
      for (List<int?> responses in allResponses) {
        if (responses[index] != null) {
          total += responses[index]!;
          count++;
        }
      }
      return count > 0 ? total / count : 0.0;
    },
  );

  // Calculate overall average
  double overallAverage =
      averageResponses.reduce((a, b) => a + b) / averageResponses.length;

  return overallAverage;
}


  static Future<void> calculateAndStoreAverageFeedback(
      String departmentName, String subject, List<String> questions) async {
    try {
      // Fetch all feedback responses for a particular subject
      final feedbackCollection = await FirebaseFirestore.instance
          .collection('Feedback')
          .doc(departmentName)
          .collection(subject)
          .get();

      if (feedbackCollection.docs.isNotEmpty) {
        List<List<int?>> allResponses = feedbackCollection.docs
            .map((doc) => (doc.data()['responses'] as List<dynamic>)
                .cast<int?>()
                .toList())
            .toList();

        // Calculate the average of all responses for each question
        List<double> averageResponses = List.generate(
          questions.length,
          (index) {
            int total = 0;
            int count = 0;
            for (List<int?> responses in allResponses) {
              if (responses[index] != null) {
                total += responses[index]!;
                count++;
              }
            }
            return count > 0 ? total / count : 0.0;
          },
        );

        // Calculate overall average
        double overallAverage =
            averageResponses.reduce((a, b) => a + b) / averageResponses.length;

        // Store the average in the Sub-Avg collection
        await FirebaseFirestore.instance
            .collection('Sub-Avg')
            .doc(departmentName)
            .collection(subject)
            .doc('Average')
            .set({'average': overallAverage});

        print('Average feedback calculated and stored!');

        // Use calculateSubjectAverage to calculate teacher subject averages
        List<DocumentSnapshot> studentsFeedbackList = feedbackCollection.docs;
        double subjectAverage = await calculateSubjectAverage(studentsFeedbackList);

        // Store the subject average in Teacher-Score collection
        await FirebaseFirestore.instance
            .collection('Teacher-Score')
            .doc(subject) // Assuming subject as document ID in Teacher-Score
            .set({'Average': subjectAverage});

        print('Subject average stored in Teacher-Score collection!');
      } else {
        print('No feedback found for this subject.');
      }
    } catch (e) {
      print('Error calculating average feedback: $e');
    }
  }
}
