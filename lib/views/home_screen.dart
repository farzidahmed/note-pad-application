import 'package:flutter/material.dart';
import 'package:polynotepad/views/add_screen.dart';
import 'package:polynotepad/views/profile_screen.dart';
import '../global widgets/customlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  final List<Widget> pages = [
    Customlist(),       // Home screen list
    AddNoteScreen(),      // Add screen
    Profile_page(),    // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // App bar color
        title: Text("Note Pad"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page_rounded), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
      body: pages[myIndex], // This will switch the pages based on the selected index
    );
  }
}
