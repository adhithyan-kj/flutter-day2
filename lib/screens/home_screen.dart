import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic, // Mimics Instagram font style natively
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.heart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.chat_bubble_text,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigates to the Instagram DM Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessagesScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Your Feed', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, color: Colors.white),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
