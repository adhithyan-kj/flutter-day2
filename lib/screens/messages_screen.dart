import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Make sure this matches your original import

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  // ---> KEEP YOUR ORIGINAL VARIABLES, LISTS, OR MODELS HERE <---
  // For example: final List<Message> conversations = ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // INSTAGRAM UI: Pure black background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), // KEEP ORIGINAL ROUTING
        ),
        title: const Row(
          children: [
            // ---> YOUR ORIGINAL APPBAR TITLE CONTENT <---
            Text(
              'Messages',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.white),
            onPressed: () {
              // ---> YOUR ORIGINAL FUNCTIONALITY <---
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // INSTAGRAM UI: Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[900], // Dark mode search field
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),

          // INSTAGRAM UI: Tab Header (Messages & Requests)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Requests',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // INSTAGRAM UI: Vertical List of Messages
          Expanded(
            child: ListView.builder(
              // ---> KEEP YOUR ORIGINAL itemCount HERE <---
              itemCount:
                  5, // Replace '5' with your original list length (e.g., conversations.length)
              itemBuilder: (context, index) {
                // ---> YOU CAN DEFINE YOUR ORIGINAL LIST ITEM VARIABLES HERE <---
                // final item = conversations[index];

                return ListTile(
                  onTap: () {
                    // ---> KEEP YOUR ORIGINAL NAVIGATION LOGIC HERE <---
                    /* Example:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(userName: item.name),
                      ),
                    );
                    */
                  },
                  leading: CircleAvatar(
                    radius: 28, // INSTAGRAM UI: Avatar size
                    backgroundColor: Colors.grey[800],
                    // ---> KEEP YOUR ORIGINAL AVATAR IMAGE/ICON HERE <---
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: const Text(
                    // ---> KEEP YOUR ORIGINAL TITLE/NAME HERE <---
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    // ---> KEEP YOUR ORIGINAL SUBTITLE/PREVIEW HERE <---
                    'Tap to view message',
                    style: TextStyle(color: Colors.grey),
                  ),
                  // INSTAGRAM UI: trailing camera icon next to chats
                  trailing: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
