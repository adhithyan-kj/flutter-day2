import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Import your chat screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Updated to hold both the username and their last message
  final List<Map<String, String>> chatData = const [
    {'name': 'Alice', 'lastMessage': 'See you tomorrow!'},
    {'name': 'Bob', 'lastMessage': 'Sent an attachment.'},
    {'name': 'Charlie', 'lastMessage': 'Haha that is hilarious 😂'},
    {'name': 'David', 'lastMessage': 'Are we still on for 8?'},
    {'name': 'Eve', 'lastMessage': 'Loved the new post!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // INSTAGRAM UI: Pure black background
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.white),
            onPressed: () {
              // Your original functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final user = chatData[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(userName: user['name']!),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 28, // INSTAGRAM UI: Slightly larger avatars
              backgroundColor: Colors.grey[800],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              user['name']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            // INSTAGRAM UI: Last message preview + time indicator
            subtitle: Text(
              '${user['lastMessage']} · 2h',
              style: const TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
            ), // IG style camera icon
          );
        },
      ),
    );
  }
}
