import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // INSTAGRAM UI: Dark mode
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[800],
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: const [
                MessageBubble(text: 'Hello!', isMe: false),
                MessageBubble(text: 'Hi there! How are you?', isMe: true),
                MessageBubble(text: 'Doing great, thanks!', isMe: false),
              ],
            ),
          ),

          // INSTAGRAM UI: Bottom Input Field Styling
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 20,
              top: 10,
            ),
            color: Colors.black,
            child: Row(
              children: [
                // IG Style blue camera icon
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF3797F0),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900], // IG dark mode input field
                      borderRadius: BorderRadius.circular(
                        25,
                      ), // IG rounded input
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// INSTAGRAM UI: Message Bubble Design
class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          // INSTAGRAM UI: Blue for me, Dark Grey for them
          color: isMe ? const Color(0xFF3797F0) : Colors.grey[900],
          borderRadius: BorderRadius.circular(20).copyWith(
            // INSTAGRAM UI: The sharp tail corner
            bottomRight: isMe
                ? const Radius.circular(4)
                : const Radius.circular(20),
            bottomLeft: !isMe
                ? const Radius.circular(4)
                : const Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
