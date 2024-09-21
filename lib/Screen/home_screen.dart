import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripquest/SearchScreen/search_screen.dart'; // Import the search screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Header without back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.9),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Add the "VTour" text on the left
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'V',
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.blue, // "V" in blue
                          ),
                        ),
                        TextSpan(
                          text: 'Tour',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // "Tour" in white
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
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
            ),
          ),
          // Main content wrapped with SingleChildScrollView to avoid overflow
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Reviews carousel (centered, larger)
                    Text(
                      'User Reviews',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: _buildReviews().map((review) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 150,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review['text'] ?? '',
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        review['author'] ?? '',
                                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    // Popular Destinations
                    Text(
                      'Popular Destinations',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 180, // Increased height to accommodate card content
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildDestinationCard('Pondicherry', 'French colonial charm', 'lib/image/hello.jpg'),
                          SizedBox(width: 16),
                          _buildDestinationCard('Ooty', 'Queen of hill stations', 'lib/image/hello.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Upcoming Trips
                    Text(
                      'Upcoming Trips',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildUpcomingTrip('Weekend Getaway to Pondicherry', 'July 15-17, 2023'),
                            SizedBox(height: 8),
                            _buildUpcomingTrip('Day Trip to Yelagiri Hills', 'July 23, 2023'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Review data for the carousel
  List<Map<String, String>> _buildReviews() {
    return [
      {
        'text':
            "I absolutely love Vitian Util! It made planning my weekend trip to Pondicherry so easy. The personalized itinerary feature is a game-changer!",
        'author': "Alice S.",
      },
      {
        'text': "Vitian Util helped me find the best spots in Ooty. A must-have app for every traveler!",
        'author': "John D.",
      },
      {
        'text':
            "Thanks to Vitian Util, I discovered hidden gems in Pondicherry that I wouldn't have found otherwise!",
        'author': "Emily R.",
      },
    ];
  }

  // Reusable UI for destination cards
  Widget _buildDestinationCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 140, // Set a fixed width for the card
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure the column takes minimal space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with fixed height
            Container(
              height: 90, // Adjust height to fit within the card
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1, // Limit to one line
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 1, // Limit to one line
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  // Reusable UI for upcoming trip tiles
  Widget _buildUpcomingTrip(String title, String date) {
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(title),
      subtitle: Text(date),
    );
  }
}
