import 'package:flutter/material.dart';

void main() {
  runApp(FeedbackApp());
}

class FeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
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
  List<int?> selectedOptions = List.filled(12, null);

  void nextPage() {
    if (currentPageIndex < questions.length - 1) {
      if (selectedOptionIndex != null) {
        setState(() {
          currentPageIndex++;
          selectedOptionIndex = null; // Reset the selected option
        });
      } else {
        // Show an error message or handle the case when a question is not answered
        // For now, just print an error message
        print('Please select an option before proceeding.');
      }
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
        ),
        body: Padding(
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
                    child: Text('Previous'),
                  ),
                ElevatedButton(
                  onPressed: nextPage,
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
        );
    }
}