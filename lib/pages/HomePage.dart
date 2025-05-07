import 'package:flutter/material.dart';
import 'package:grandwaste/pages/AccountPage.dart';
import 'package:grandwaste/pages/ActiveOrders.dart';
import 'package:grandwaste/pages/HomeContentPage.dart';
import 'package:grandwaste/pages/NotificationsPage.dart';
import 'package:grandwaste/pages/orders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // This holds all your screens
  final List<Widget> pages = [
    HomeContentPage(),     // Your original UI
    Orders(),
    Activeorders(),
    NotificationsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Orders(s)"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Active Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
