import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'location_data.dart';  // Adjusted import for your locs folder

class VitaRoundScreen extends StatefulWidget {
  static const routeName = '/vita-round';

@override
  _VitaRoundScreenState createState() => _VitaRoundScreenState();
}

class _VitaRoundScreenState extends State<VitaRoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Around VIT'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hot Locations (CarouselSlider similar to HomeScreen)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hot Locations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: false,  
                enlargeCenterPage: true, 
              ),
              items: LocationData.hotLocations.map((location) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(location['image']!),  // Image from assets
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            location['name']!,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Netflix-style horizontal lists
            _buildCategorySection('Restaurants', LocationData.restaurants),
            SizedBox(height: 20),
            _buildCategorySection('Fun Spots', LocationData.funSpots),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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

  Widget _buildCard(Map<String, String> item) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(item['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(8.0),
          child: Text(
            item['name']!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant-detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Image.asset(args['image']!, width: double.infinity, height: 250.0, fit: BoxFit.cover),
            SizedBox(height: 10.0),
            // Description section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                args['description']!,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            // Placeholder for future review system
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
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