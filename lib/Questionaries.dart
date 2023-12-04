import 'package:flutter/material.dart';
import 'teacher_score.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'student_provider.dart';
import 'feedback_utlis.dart';

class FeedbackApp extends StatefulWidget {
   final String subject;
  final String studentId;
   final String departmentName;
    FeedbackApp({
    required this.subject,
    required this.studentId,
    required this.departmentName,
  });

  @override
  State<FeedbackApp> createState() => _FeedbackAppState();
}

class _FeedbackAppState extends State<FeedbackApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Feedback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackForm(
         subject: widget.subject, // Pass subject to FeedbackForm
        studentId: widget.studentId, 
        departmentName: widget.departmentName, 
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {

  final String subject;
  final String studentId;
  final String departmentName;
  FeedbackForm({
    required this.subject,
    required this.studentId,
   required this.departmentName,
  });
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> questions = [
        'The teacher covers the entire syllabus.',
    'The teacher discusses topics in detail',
    'The teacher communicates clearly',
    'The teacher inspires me by his/her knowledge in the subject',
    'The teacher is punctual to the class',
    'The teacher engages the class to the full duration and completes the course in time',
    'The teacher comes fully prepared for the class.',
    'The teacher provides guidance counseling in academic and non-academic matters in/outside the class.',
    'The teacher pays attention to academically weaker students as well.',
    'The teacher relates the course material with real-world situations',
    'The teacher’s attitude toward the students was friendly and helpful',
  ];

  int currentPageIndex = 0;
  int? selectedOptionIndex;
  List<int?> selectedOptions = List.filled(11, null);
  
  void nextPage() {
    if (currentPageIndex < questions.length - 1) {
      if (selectedOptionIndex != null) {
        setState(() {
          currentPageIndex++;
          selectedOptionIndex = null; // Reset the selected option
        });
      } else {
        print('Please select an option before proceeding.');
      }
    } else {
      submitFeedback();
    }
  }

  void previousPage() {
    if (currentPageIndex > 0) {
      setState(() {
        currentPageIndex--;
        selectedOptionIndex = null; // Reset the selected option
      });
    }
  }

  void onOptionSelected(int index) {
    setState(() {
      selectedOptionIndex = index;
      selectedOptions[currentPageIndex] = index + 1; // Mapping to 1-5
    });
  }

  Future<void> submitFeedback() async {
    // Replace 'userUID' with the actual user ID
    // String userUID = widget.studentId; // Retrieve user ID from your authentication system
   DatabaseManager databaseManager = DatabaseManager();
    Map<String, dynamic> feedbackData = {
      'responses': selectedOptions,
    };

    try {
    //   await _firestore
    //            .collection('Feedback')
    // .doc(widget.subject) // Replace with the subject name
    // .collection(widget.studentId) // Use widget.studentId (with lowercase 's')
    // .doc(userUID) // Document for each user's UID
    // .set(feedbackData);

    await _firestore
        .collection('Feedback') // Root collection for feedback
        .doc(widget.departmentName) 
        .collection(widget.subject) // Collection for the subject
        .doc(widget.studentId) // Document for the student's UID
        .set(feedbackData);

      
      print('Feedback submitted!');
     await FeedbackUtils.calculateAndStoreAverageFeedback(
        widget.departmentName, widget.subject, questions);
      await databaseManager.calculateAndStoreTeacherSubjectAverages();
    } catch (e) {
      print('Error submitting feedback: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                questions[currentPageIndex],
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Column(
                children: List.generate(5, (index) {
                  return ListTile(
                    title: Text(['Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree'][index]),
                    leading: Radio(
                      value: index,
                      groupValue: selectedOptionIndex,
                      onChanged: (value) {
                        onOptionSelected(value!);
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 20.0),
              if (currentPageIndex > 0)
                ElevatedButton(
                  onPressed: previousPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text('Previous'),
                ),
              ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(currentPageIndex == questions.length - 1 ? 'Submit' : 'Next'),
              ),
              SizedBox(height: 20.0),
              if (currentPageIndex < questions.length - 1)
                Text(
                  'Page ${currentPageIndex + 1} of ${questions.length}',
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}




