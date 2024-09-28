import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background like in the provided screenshot
      appBar: AppBar(
        backgroundColor: Colors.black, // Dark app bar for contrast
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'V',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Tour',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Navigate to search screen
              // Implement the search functionality if needed
            },
          ),
        ],
      ),
      body: const Center(
        child: SizedBox(), // Leaving the screen blank for now
      ),
    );
  }
}
