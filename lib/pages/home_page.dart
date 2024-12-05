import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:qazimasters/pages/chats_page.dart';
import 'package:qazimasters/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Dummy data for departments and workers
  final Map<String, List<Map<String, String>>> _departments = {
    "Engineering": [
      {"name": "Alice Johnson", "role": "Software Engineer"},
      {"name": "Bob Smith", "role": "DevOps Engineer"},
    ],
    "HR": [
      {"name": "Cathy Brown", "role": "HR Manager"},
      {"name": "Daniel Lee", "role": "Recruiter"},
    ],
    "Marketing": [
      {"name": "Eva White", "role": "Marketing Specialist"},
      {"name": "Frank Green", "role": "SEO Expert"},
    ],
    "Tailors": [
      {"name": "Eva White", "role": "Marketing Specialist"},
      {"name": "Frank Green", "role": "SEO Expert"},
    ],
    "Artisans": [
      {"name": "Eva White", "role": "Marketing Specialist"},
      {"name": "Frank Green", "role": "SEO Expert"},
    ],
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages
    if (index == 1) {
      // Navigate to Chat Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatsPage()),
      );
    } else if (index == 2) {
      // Navigate to Profile Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Departments & Profiles'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: _departments.entries.map((entry) {
          final departmentName = entry.key;
          final workers = entry.value;

          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              title: Text(
                departmentName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.apartment, color: Colors.blue),
              children: workers.map((worker) {
                return ListTile(
                  leading: const Icon(Icons.person, color: Colors.grey),
                  title: Text(worker["name"] ?? ""),
                  subtitle: Text(worker["role"] ?? ""),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.green,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: _selectedIndex == 0 ? Colors.amber : Colors.white,
          ),
          Icon(
            Icons.chat_bubble_outline,
            size: 30,
            color: _selectedIndex == 1 ? Colors.amber : Colors.white,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: _selectedIndex == 2 ? Colors.amber : Colors.white,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
