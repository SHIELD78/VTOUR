import 'package:flutter/material.dart';
import 'personalized_itinerary_page.dart'; // Import the new pages
import 'faq_page.dart';
import 'inspire_trip_page.dart';

class TabSearchScreen extends StatelessWidget {
  final String searchQuery;

  TabSearchScreen({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Reusable button with gradient, shadows, and rounded corners
    Widget buildGradientButton(String text, List<Color> gradientColors, IconData icon, Widget targetPage) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 5), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        backgroundColor: Colors.blue[800],
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You searched for: $searchQuery',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                SizedBox(height: 30),

                // Button 1: Personalized Itinerary
                buildGradientButton(
                  'Personalized Itinerary',
                  [Colors.blue, Colors.blueAccent],
                  Icons.map_outlined,
                  PersonalizedItineraryPage(searchQuery: searchQuery),
                ),
                SizedBox(height: 15),

                // Button 2: Frequently Asked Questions
                buildGradientButton(
                  'Frequently Asked Questions',
                  [Colors.green, Colors.greenAccent],
                  Icons.help_outline,
                  FAQPage(searchQuery: searchQuery),
                ),
                SizedBox(height: 15),

                // Button 3: Inspire Trip
                buildGradientButton(
                  'Inspire Trip',
                  [Colors.orange, Colors.deepOrangeAccent],
                  Icons.lightbulb_outline,
                  InspireTripPage(searchQuery: searchQuery),
                ),
              ],
            ),
          ),
        ],
      ),
     
    );
  }
}
