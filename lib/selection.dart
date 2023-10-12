import 'package:flutter/material.dart';
import 'Questionaries.dart';

class FeedbackFormScreen extends StatefulWidget {
  final String departmentName;

  FeedbackFormScreen({required this.departmentName});

  @override
  _FeedbackFormScreenState createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  String selectedSemester = 'Semester 2nd'; // Initialize with a valid value from the list
  String selectedTeacher = 'Dr. Simranjeet Kaur (Botany)'; // Initialize with a valid value from the list
  String subjectName = '';

  final List<String> semesters = [
    'Semester 2nd',
    'Semester 4th',
    'Semester 6th',
    'Semester 8th',

  ];
  final List<String> teachers = [
    'Dr. Simranjeet Kaur (Botany)',

    'Dr. Harwinder Kaur (Botany)',

    'Mr. Mohd Ishrath (Centre for Competitive Examinations)',

    'Ms. Anmol Singla (Centre for Competitive Examinations)',

    'Mrs. Aysha Rafiya (Centre for Competitive Examinations)',

    'Dr. Sandeep Kumar (Chemistry)',

    'Dr. Atul Kumar (Chemistry)',

    'Dr. Vajinder Kumar (Chemistry)',

    'Dr. Tirtha Mukerjee (Chemistry)',

    'Ms. Pallvi Parnami (Commerce)',

    'Ms Hariot Kaur (Commerce)',

    'Ms. Harjot Kaur (Commerce)',

    'Mr. Rakesh Kumar (Commerce)',

    'Mr. Suresh Kumar (Commerce)',

    'Mr. Ankush Goyal (Commerce)',

    'Dr. Parvin Kumar (Computer Science)',

    'Dr. Upinder Kaur (Computer Science)',

    'Dr. Navroop Kaur (Computer Science)',

    'Dr. Ramakant Kumar (Computer Science)',

    'Mr. Harpal Singh (Computer Science)',

    'Ms. Harmandeep Kaur (Computer Science)',

    'Ms. Parneet Kaur (Computer Science)',

    'Mr. Maddassar Jalal (Computer Science)',

    'Ms. Komal Kanwar Shekhawat (Economics)',

    'Dr. Arvind Kumar Yadav (Economics)',

    'Dr. Parveen Rani (Economics)',

    'Mr. Pushp Kumar (Economics)',

    'Ms. Poonam Rani (Economics)',

    'Dr. Birender Kaur (Education)',

    'Dr. Rashim Wadhwa (Education)',

    'Ms. Zeba Fatima (Education)',

    'Dr. Abdul Haseeb (Education)',

    'Dr. Rajani Chhabra (Education)',

    'Mr. Harjeet Singh (Education (History))',

    'Mr. Mukhtar Ahmed (Education (Pol. Science))',

    'Ms. Binder Pal Kaur (English)',

    'Ms. Parul Priya (English)',

    'Dr. Lois Jose (English)',

    'Dr. Tajamul Islam (English)',

    'Ms. Amanjeet Brar (English)',

    'Dr.. Ajmaul Ansari (English)',

    'Ms. Simarjeet Kaur (EVS)',

    'Dr. Sukhpreet Kaur Sidhu (Mathematics)',

    'Dr. Sandeep Singh (Mathematics)',

    'Dr. Baljinder Kaur (Mathematics)',

    'Mr. Vinod Kumar (Mathematics)',

    'Mr. Sayed Mohammad Abdal (Mathematics)',

    'Ms. Fiza Wadhwa (Mathematics)',

    'Dr. Sukhjeet Singh (Physics)',

    'Dr. Rajan Saini (Physics)',

    'Dr. Amandeep Sharma (Physics)',

    'Dr. Ramandeep Kaur (Physics)',

    'Dr. Janpreet Singh (Physics)',

    'Dr. Sushil Kumar (Physics)',

   ' Dr. Birbikram Singh (Physics)',

   ' Mr. Jagtar Singh (Physics)',

   ' Dr. Chandani Rani (Psychology)',

   ' Mr. Lavish Chugh (Psychology)',

   ' Ms. Simarjeet Kaur (Psychology)'

    'Dr. Sandeep Singh (Punjabi)',

   ' Dr. Harjinder Singh (Punjabi)',

    'Dr. Jaswinder Kaur (Punjabi)',

    'Ms. Ramandeep Kaur (Punjabi)',

    'Mr. Navsangeet Singh (Punjabi)',

    'Mr. Gurnam Singh (Punjabi)',

    'Dr. Somi Ram (Punjabi)',

    'Dr. Tarsem Singh (SGGS)',

    'Dr. Hilal Ramzan (Social Science)',

    'Dr. Dharminder Sharma (Zoology)',

    'Dr. Abhinav Saxena (Zoology)',

    'Dr. Komalpreet Kaur (Zoology)',

   ' Dr. Amandeep Singh Bhandari',

    'Ms. Nancy (Research Scholar)',

    'Bhumika Arora (R.Scholar, Botany)',

    'Muskan (R.Scholar, Botany)',

    'Tashima (R.Scholar, Botany)',

    'Jashanpreet Kaur (R.Scholar, Botany)',

    'Sonia Randhawa (R.Scholar, Chemistry)',

   ' Manmeet Kaur (R.Scholar, Chemistry)',

   ' Parminder Kaur (R.Scholar, Chemistry)',

    'Anupriya (R.Scholar, Chemistry)',


    'Manjit Kaur (R.Scholar, CSE)',

    'Jasveer Kaur (R.Scholar, Economics)'

    'Navdeep Kaur (R.Scholar, English)',

    'Kiran Deep Kaur (R.Scholar, English)',

    'Ramandeep Kaur (R.Scholar, Mathematics)',

    'Navjot Kaur (R.Scholar, Physics)',

   ' Manpreet Kaur (R.Scholar, Physics)'

   ' Rajvir Kaur (R.Scholar, Psychology)',

   ' Kirandeep Kaur (R.Scholar, Punjabi)',

   ' Rupinder Kaur (R.Scholar, Punjabi)',

   ' Rajvir Kaur (R.Scholar, Psychology)',

    'Kirandeep Kaur (R.Scholar, Punjabi)',

    'Rupinder Kaur (R.Scholar, Punjabi)',

    'Rajat (R.Scholar, Zoology)',

    'Ms. Kamaljeet Kaur (IT)',

   ' Ms. Kulvir Kaur (IT)',

   ' Ms. Sukhjot Kaur (R. Scholar, Psychology)',

    'Dr. Sandeep Kaur (Mathematics)',

    'Ms. Harmanpreet Kaur (Chemistry)',

    'Mr. Yasir Ahmed (English)',

    'Ms. Aparna Vashishtha (Psychology)',

    'Ms. Rikza Pervez (Psychology)',

    'Dr. Zohra Khatoon (Psychology)',

    'Dr. Kamaldeep Kaur (Botany)',
  
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Feedback - ${widget.departmentName}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12,),
            Text(
              'Select Semester:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedSemester,
              onChanged: (newValue) {
                setState(() {
                  selectedSemester = newValue!;
                });
              },
               isExpanded: true,
              items: semesters.map((semester) {
                return DropdownMenuItem<String>(
                  value: semester,
                  child: Text(semester),
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            Text(
              'Select Teacher:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedTeacher,
              onChanged: (newValue) {
                setState(() {
                  selectedTeacher = newValue!;
                });
              },
               isExpanded: true,
              items: teachers.map((teacher) {
                return DropdownMenuItem<String>(
                  value: teacher,
                  child: Text(teacher),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Subject Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                subjectName = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
