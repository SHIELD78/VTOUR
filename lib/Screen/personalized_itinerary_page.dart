import 'package:flutter/material.dart';

class PersonalizedItineraryPage extends StatelessWidget {
  final String searchQuery;

  const PersonalizedItineraryPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalized Itinerary'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Personalized Itinerary for: $searchQuery',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}