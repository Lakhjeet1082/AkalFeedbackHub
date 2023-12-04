
import 'package:flutter/material.dart';
import 'departments.dart';
import 'notice.dart';
import 'login.dart';
import 'suggestion.dart';
import 'Student_details.dart';
// import 'FeedbackFormScreen.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.black,
        title: Expanded(child: Text('AkalFeedbackHub', overflow: TextOverflow.ellipsis)),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.of(context).push(_createPageRoute());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Crafting Excellence Through Your Feedback!',
                style: TextStyle(
                  color: Colors.amberAccent,
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
        MaterialPageRoute(builder: (context) => StudentUidScreen()),
      );
    }
    else if (item.title == 'Suggestions') {
      // Navigate to the Suggestions screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SuggestionFormScreen()),
      );
    } 
    else if (item.title == 'Notices') {
      // Navigate to the Notices screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoticePage()),
      );
    }
   
  
}
}
 PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Login(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
