import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  const ChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=20'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Active now',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
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
              padding: const EdgeInsets.all(16.0),
              children: [
                // Instagram profile intro
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=20',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Instagram',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),

                // Static dummy messages mimicking Instagram gradient layout
                const MessageBubble(text: 'Hey! How are you?', isMe: false),
                const MessageBubble(
                  text: 'I am good, what about you?',
                  isMe: true,
                ),
                const MessageBubble(
                  text: 'Check out this new UI redesign!',
                  isMe: true,
                ),
                const MessageBubble(
                  text: 'Looks exactly like Instagram!',
                  isMe: false,
                ),
              ],
            ),
          ),

          // Bottom Input Field
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 15.0,
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3797F0), // Instagram Blue
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Message...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: Colors.white),
                        SizedBox(width: 15),
                        Icon(Icons.photo_outlined, color: Colors.white),
                        SizedBox(width: 15),
                        Icon(Icons.sticky_note_2_outlined, color: Colors.white),
                      ],
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

// Internal widget for generating Instagram-styled Chat Bubbles
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
          // Instagram uses solid blue for sender, grey for receiver
          color: isMe ? const Color(0xFF3797F0) : Colors.grey[900],
          borderRadius: BorderRadius.circular(20).copyWith(
            bottomRight: isMe
                ? const Radius.circular(5)
                : const Radius.circular(20),
            bottomLeft: isMe
                ? const Radius.circular(20)
                : const Radius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
