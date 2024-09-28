import 'package:flutter/material.dart';
import 'package:tripquest/Screen/tab_search_screen.dart'; // Import the new TabSearchScreen

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  // List of cities to search
  List<String> cities = ["Pondicherry", "Ooty", "Bangalore", "Coorg", "Chennai"];
  
  // Filtered list of cities based on user input
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Initialize with all cities
    filteredCities = cities;
    // Listen for changes in the search field
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    setState(() {
      filteredCities = cities
          .where((city) => city.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  // Function to handle the click on a search result and navigate to TabSearchScreen
  void _onCityTap(String city) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TabSearchScreen(searchQuery: city),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Start typing here...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Recent Searches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const RecentSearches(),
            const SizedBox(height: 20),
            const Text(
              "What's India Searching For",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const PopularSearches(),
            const SizedBox(height: 20),
            const Text(
              "Search Results",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Show filtered search results
            Column(
              children: filteredCities.map((city) {
                return InkWell(
                  onTap: () => _onCityTap(city),  // Redirect to TabSearchScreen on tap
                  child: ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text(city),
                  ),
                );
              }).toList(),
            ),
            if (filteredCities.isEmpty && _searchController.text.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No results found"),
              ),
          ],
        ),
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Culture in Coorg'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Best places to visit in Bangalore'),
        ),
      ],
    );
  }
}

class PopularSearches extends StatelessWidget {
  const PopularSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Top tourist spots in Pondicherry'),
        ),
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Things to do in Ooty'),
        ),
      ],
    );
  }
}