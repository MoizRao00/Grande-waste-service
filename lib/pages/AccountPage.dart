import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/GWS logo.png'), // Replace with your image
            ),
            const SizedBox(height: 15),
            Text(
              "Clients Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("123@example.com",
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 30),
            buildAccountOption(Icons.person, "Profile"),
            buildAccountOption(Icons.settings, "Settings"),
            buildAccountOption(Icons.history, "Order History"),
            buildAccountOption(Icons.help_outline, "Help & Support"),
            buildAccountOption(Icons.logout, "Logout"),
          ],
        ),
      ),
    );
  }

  Widget buildAccountOption(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Add your navigation or logic here
        },
      ),
    );
  }
}
