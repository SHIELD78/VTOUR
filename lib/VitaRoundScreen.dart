import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'location_data.dart';  // Adjusted import for your locs folder

class VitaRoundScreen extends StatefulWidget {
  static const routeName = '/vita-round';

  const VitaRoundScreen({super.key});

  @override
  _VitaRoundScreenState createState() => _VitaRoundScreenState();
}

class _VitaRoundScreenState extends State<VitaRoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Around VIT',
          style: TextStyle(
            fontFamily: 'Roboto', // Custom modern font (replace with your own if needed)
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Clean black text on white background
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50], // Subtle gradient background
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hot Locations (CarouselSlider similar to HomeScreen)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Hot Locations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Consistent text color
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,  // Increase height slightly for better visuals
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,  // Ensures images fit well and have minimal padding
                ),
                items: LocationData.hotLocations.map((location) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: AssetImage(location['image']!),
                              fit: BoxFit.cover,  // Ensure the image fits the card properly
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,  // Align text to the bottom-left
                            child: Container(
                              width: double.infinity,  // Ensure the text background spans across the card
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),  // Semi-transparent black background
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Text(
                                location['name']!,
                                style: const TextStyle(
                                  fontSize: 20.0,  // Slightly smaller for a cleaner look
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,  // Bold to make the text stand out
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Category Sections
              _buildCategorySection('Restaurants', LocationData.restaurants),
              const SizedBox(height: 20),
              _buildCategorySection('Fun Spots', LocationData.funSpots),
            ],
          ),
        ),
      ),
    );
  }

  // Build Category Section (Netflix-style horizontal list)
  Widget _buildCategorySection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Icon(Icons.restaurant, color: Colors.blue), // Add icon for each category
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Consistent text color
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the detail screen
                  Navigator.pushNamed(
                    context,
                    RestaurantDetailScreen.routeName,
                    arguments: {
                      'name': items[index]['name']!,
                      'image': items[index]['image']!,
                      'description': items[index]['description']!,
                    },
                  );
                },
                child: _buildCard(items[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  // Build each card for categories
  Widget _buildCard(Map<String, String> item) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(item['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,  // Align text to the bottom-left for better aesthetics
        child: Container(
          width: double.infinity,  // Stretch the background across the width
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),  // Semi-transparent black background
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Text(
            item['name']!,
            style: const TextStyle(
              fontSize: 16.0,  // Slightly smaller for a cleaner look
              color: Colors.white,
              fontWeight: FontWeight.bold,  // Bold to make the text stand out
            ),
          ),
        ),
      ),
    );
  }
}

// Restaurant Detail Screen Code
class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant-detail';

  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']!),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Image.asset(args['image']!, width: double.infinity, height: 250.0, fit: BoxFit.cover),
            const SizedBox(height: 10.0),
            // Description section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                args['description']!,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Reviews (to be added later)",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 