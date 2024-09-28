import 'package:flutter/material.dart';
import 'package:tripquest/SearchScreen/search_screen.dart'; // Import the search screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
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
                const Text('Reviews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                _buildHorizontalReviewCards(), // Horizontal Review Cards
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build horizontal review cards without continuous scrolling
  Widget _buildHorizontalReviewCards() {
    return SizedBox(
      height: 120, // Adjusted height for the reviews section
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController, // Use the scroll controller for manual scrolling
        children: [
          const SizedBox(width: 10),
          _buildReviewCard(
            "I absolutely love Vitian Util! It made planning my weekend trip to Pondicherry so easy. The personalized itinerary....",
            "Alice S.",
            'lib/image/gallery2.jpg',
          ),
          const SizedBox(width: 10),
          _buildReviewCard(
            "VTour helped me discover hidden gems in Ooty. The suggestions were spot on, and the user interface is incredibly easy to use...",
            "Bob M.",
            'lib/image/hello.jpg',
          ),
          const SizedBox(width: 10),
          _buildReviewCard(
            "Fantastic app! The itineraries are personalized, and the customer support is excellent. Highly recommend for any travel enthusiast!",
            "Charlie T.",
            'lib/image/gallery1.jpg',
          ),
        ],
      ),
    );
  }

  // Modified Review Card (Larger, with image on the right)
  Widget _buildReviewCard(String review, String name, String imageUrl) {
    return SizedBox(
      width: 300, // Reduced width to prevent overflow
      height: 110, // Set a height to ensure proper sizing
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Adjusted padding to fit within the bounds
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded text section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Ensure the column takes only the needed space
                    children: [
                      Flexible(
                        child: Text(
                          review,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                          maxLines: 3, // Limit to 3 lines
                          overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                        ),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8), // Add space between text and image

                // Image section
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl, // Placeholder image path
                    height: 70, // Adjusted height for visibility
                    width: 70, // Adjusted width to keep it square
                    fit: BoxFit.cover, // Ensure the image fits properly
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
