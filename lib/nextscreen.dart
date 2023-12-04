import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final Map<dynamic, dynamic> userDetails;

  const NextScreen({required this.userDetails, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${userDetails['name']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${userDetails['email']}',
              style: TextStyle(fontSize: 18),
            ),
            // Add more Text widgets or UI elements to display other details
          ],
        ),
      ),
    );
  }
}
