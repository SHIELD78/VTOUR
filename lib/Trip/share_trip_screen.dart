import 'package:flutter/material.dart';

class ShareTripScreen extends StatelessWidget {
  final TextEditingController _tripDetailsController = TextEditingController();

  ShareTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Your Trip"),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Share Your Trip Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _tripDetailsController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter details about your trip...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for sharing trip details (e.g., backend or UI feedback)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Trip details shared!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Use backgroundColor instead of primary
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}