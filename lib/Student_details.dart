

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:try_project/departments.dart';
import 'package:try_project/nextscreen.dart';
import 'package:try_project/selection.dart';


// Future<Student?> getStudentDetails(String enteredUid) async {
//   final ref = FirebaseDatabase.instance.ref("Students");
//   print('getStudentDetails called with UID: $enteredUid');

//   try {
//     DataSnapshot snapshot = await ref.child(enteredUid).once();

//     if (snapshot.value != null) {
//       Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;

//       if (values != null) {
//         return Student.fromMap(values);
//       }
//     }
//     print('Data not found or unexpected structure');
//     return null; // Return null if UID doesn't exist in the database or data structure is unexpected
//   } catch (e) {
//     print('Error fetching data: $e');
//     return null; // Handle any errors in data retrieval
//   }
// }


class StudentUidScreen extends StatelessWidget {
  const StudentUidScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    TextEditingController uidController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Student UID'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: uidController,
                decoration: InputDecoration(
                  labelText: 'Student UID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the UID';
                  }
                  if (value.length > 9 || value.length < 9) {
                    return 'Invalid UID.. Enter correct!!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       // Form is valid, proceed with navigation or actions
              //       // For example, navigate to the next screen
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => NextScreen(),
              //         ),
              //       );
              //     }
              //   },
              //   child: Text('Submit'),
              // ),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      String enteredUid = uidController.text;

      if (enteredUid.isNotEmpty && enteredUid.length == 9) {
        // If the entered UID is valid, proceed to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeedbackFormScreen(studentId: enteredUid),
          ),
        );
      } else {
        // Show an error message for an invalid student ID length
        print('Invalid student ID! Please enter a 9-digit ID.');
        // Show a message or handle this case accordingly
      }
    }
  },
  child: Text('Submit'),
),


            ],
          ),
        ),
      ),
    );
  }
}

