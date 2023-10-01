
import 'package:flutter/material.dart';
import 'Home.dart';
// import 'FeedbackFormScreen.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Feedback App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<DashboardItem> items = [
    DashboardItem('Give Feedback', Icons.feedback, Colors.blue),
    DashboardItem('Suggestions', Icons.lightbulb, Colors.green),
    DashboardItem('Notices', Icons.notifications, Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College Feedback App'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the University Feedback App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return DashboardCard(item: items[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  DashboardItem(this.title, this.icon, this.color);
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      
      child: InkWell(
        onTap: () {
          // Handle item click here
          // You can navigate to the respective screens or perform actions
          _navigateToScreen(context, item); // Pass the 'item' parameter
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                item.icon,
                size: 50,
                color: item.color,
              ),
              SizedBox(height: 8),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to navigate to the respective screens based on the card title
  void _navigateToScreen(BuildContext context, DashboardItem item) {
    if (item.title == 'Give Feedback') {
      // Navigate to the Give Feedback screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Departments()),
      );
    }
    // else if (item.title == 'Suggestions') {
    //   // Navigate to the Suggestions screen
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => SuggestionsScreen()),
    //   );
    // } else if (item.title == 'Notices') {
    //   // Navigate to the Notices screen
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => NoticesScreen()),
    //   );
    // }
    // Add more conditions for other cards/screens if needed
  
}
}
