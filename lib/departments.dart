// import 'package:flutter/material.dart';
// import 'selection.dart';

// void main() => runApp(Departments());

// class Departments extends StatelessWidget {
//   final List<Department> departments = [
//     Department(name: 'Computer Science (B.tech)', description: 'Department of Computer Science (B.tech) studies.'),
//     Department(name: 'Computer Science (BCA)', description: 'Department of Computer Science (BCA) studies.'),   
//     Department(name: 'Physics', description: 'Department of Physics studies.'),
//     Department(name: 'Botany', description: 'Department of Botany studies.'),
//     Department(name: 'Commerce', description: 'Department of Commerce studies.'),
//     Department(name: 'English Studies', description: 'Department of English studies.'),
//     Department(name: 'Zoology', description: 'Department of Zoology studies.'),
//     Department(name: 'Punjabi', description: 'Department of Punjabi studies.'),
//     Department(name: 'Education', description: 'Department of Education studies.'),
//     Department(name: 'Social Science', description: 'Department of Social Science studies.'),
//     Department(name: 'Mathematics', description: 'Department of Mathematics studies.'),
//     Department(name: 'Psychology', description: 'Department of Psychology studies.'),
//     Department(name: 'Economics', description: 'Department of Economics studies.'),
//     Department(name: 'Chemistry', description: 'Department of Chemistry studies.'),
//     Department(name: 'SGGS', description: 'Department of SGGS studies.'),
//     Department(name: 'MBA', description: 'Department of MBA studies.'),
//     Department(name: 'BBA', description: 'Department of BBA studies.'),
//     Department(name: 'BSc Medical', description: 'Department of BSc Medical studies.'),
//     Department(name: 'BSc Non-Medical', description: 'Department of BSc Non-Medical studies.'),
//     Department(name: 'BSc Physiotherapy', description: 'Department of BSc Physiotherapy studies.'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//       title: 'University Departments',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('University Departments'),
//           backgroundColor: Colors.black,
//         ),
//         body: Center(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 1.2, // Set the aspect ratio to control the width of the items
//             ),
//             itemCount: departments.length,
//             itemBuilder: (context, index) {
//               return DepartmentCard(department: departments[index]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Department {
//   final String name;
//   final String description;

//   Department({required this.name, required this.description});
// }

// class DepartmentCard extends StatelessWidget {
//   final Department department;

//   DepartmentCard({required this.department});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => FeedbackFormScreen(departmentName: department.name),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Colors.black, width: 2), // Outline color
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 3,
//               blurRadius: 7,
//               offset: Offset(0, 7), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             department.name,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }