import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripquest/SearchScreen/search_screen.dart'; // Import the search screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Reviews Section
              Text('User Reviews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _buildReviewCard(),
              SizedBox(height: 24),

              // Popular Destinations Section
              Text('Popular Destinations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDestinationCard('Pondicherry', 'French colonial charm', 'lib/image/hello.jpg'),
                  _buildDestinationCard('Ooty', 'Queen of hill stations', 'lib/image/hello.jpg'),
                ],
              ),
              SizedBox(height: 24),

              // Upcoming Trips Section
              Text('Upcoming Trips', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              _buildUpcomingTripCard(),
            ],
          ),
        ),
      ),
    );
  }

  // Modified Review Card (Larger, with image on the right)
  Widget _buildReviewCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I absolutely love Vitian Util! It made planning my weekend trip to Pondicherry so easy. The personalized itinerary feature is a game-changer!",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text("Alice S.", style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
                ],
              ),
            ),
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/image/hello.jpg',  // Placeholder image path
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Destination Card for Popular Destinations
  Widget _buildDestinationCard(String title, String subtitle, String imageUrl) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(imageUrl, height: 100, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.blueGrey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Upcoming Trip Card (Larger Image with Calendar)
  Widget _buildUpcomingTripCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('lib/image/burgerking.jpg', height: 150, fit: BoxFit.cover), // Calendar image
            ),
            SizedBox(height: 16),
            Text('Weekend Getaway to Pondicherry', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('July 15-17, 2023'),
            Text('Day Trip to Yelagiri Hills'),
          ],
        ),
      ),
    );
  }
}