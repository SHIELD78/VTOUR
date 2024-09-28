import 'package:flutter/material.dart';
import 'personalized_itinerary_page.dart'; // Import the new pages
import 'faq_page.dart';
import 'inspire_trip_page.dart';

class TabSearchScreen extends StatelessWidget {
  final String searchQuery;

  const TabSearchScreen({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search for destinations...',
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true, // Automatically adds a back button
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Pop the current screen to go back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Explore sections like in the reference image
            Text(
              'Explore $searchQuery',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),

            // Example of place suggestion cards
            Row(
              children: [
                Flexible(
                  child: buildPlaceCard('Explore Top Attractions', 'Must-see places in $searchQuery', 'lib/image/calendar.png'),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: buildPlaceCard('Discover Local Cuisine', 'Taste the regional flavors', 'lib/image/calendar.png'),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: buildPlaceCard('Find The Best Accommodations', 'Comfortable stays for every budget', 'lib/image/calendar.png'),
                ),
              ],
            ),
            
            const Spacer(), // Pushes the buttons to the bottom

            // Center-align the buttons
            Align(
              alignment: Alignment.center, // Center the buttons horizontally
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize the column height to the content
                crossAxisAlignment: CrossAxisAlignment.center, // Align buttons in the center
                children: [
                  buildSizedChipButton('Personalized Itinerary', context, Icons.map_outlined, PersonalizedItineraryPage(searchQuery: searchQuery)),
                  const SizedBox(height: 20), // Consistent spacing between buttons
                  buildSizedChipButton('Frequently Asked Questions', context, Icons.help_outline, FAQPage(searchQuery: searchQuery)),
                  const SizedBox(height: 20), // Consistent spacing between buttons
                  buildSizedChipButton('Inspire Trip', context, Icons.lightbulb_outline, InspireTripPage(searchQuery: searchQuery)),
                ],
              ),
            ),

            const SizedBox(height: 20), // Padding at the bottom for spacing
          ],
        ),
      ),
    );
  }

  // Build a chip-like button with consistent size for all buttons
  Widget buildSizedChipButton(String text, BuildContext context, IconData icon, Widget targetPage) {
    return SizedBox(
      width: 250,  // Fixed width for all buttons
      height: 60,  // Fixed height for all buttons
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners for the button
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the text and icon
          children: [
            Icon(icon, color: Colors.white, size: 20), // Icon with consistent size
            const SizedBox(width: 10), // Space between the icon and text
            Flexible( // Make the text flexible to avoid overflow
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16, // Text size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow text
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Create place cards with images like the reference image
  Widget buildPlaceCard(String title, String subtitle, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
