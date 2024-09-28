import 'package:flutter/material.dart';

class InspireTripPage extends StatelessWidget {
  final String searchQuery;

  const InspireTripPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Sample trip data for demonstration
    final List<Map<String, dynamic>> trips = [
      {
        'destination': 'Japan, 2023',
        'sharedBy': 'Leslie',
        'date': 'Jan 2023',
        'description': 'Planning a trip to Japan next year. Here\'s what I have so far. Any tips?',
        'images': [
          'https://example.com/japan1.jpg',
          'https://example.com/japan2.jpg',
          'https://example.com/japan3.jpg',
          'https://example.com/japan4.jpg'
        ],
      },
      {
        'destination': 'Italy, 2022',
        'sharedBy': 'Alex',
        'date': 'Dec 2022',
        'description': 'Excited to explore Italy next year. Here\'s my itinerary, any must-visit places?',
        'images': [
          'https://example.com/italy1.jpg',
          'https://example.com/italy2.jpg',
          'https://example.com/italy3.jpg',
          'https://example.com/italy4.jpg'
        ],
      },
      // Add more trip data here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspired Trips'),
        backgroundColor: Colors.orange[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            final trip = trips[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destination and shared by information
                  Text(
                    trip['destination'],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Shared by ${trip['sharedBy']} · ${trip['date']}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    trip['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  // Grid of images for the trip
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: trip['images'].length,
                    itemBuilder: (context, imageIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          trip['images'][imageIndex],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  // Interaction icons (like and comments)
                  const Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('120', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 20),
                      Icon(Icons.comment_outlined, color: Colors.grey),
                      SizedBox(width: 5),
                      Text('10', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}