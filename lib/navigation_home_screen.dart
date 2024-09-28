import 'package:flutter/material.dart';
import 'Screen/home_screen.dart';

import 'Screen/Bookings_screen.dart';
import 'Screen/journey_screen.dart'; 
import 'Screen/profile_screen.dart';
import 'VitaRoundScreen.dart'; // Add VitaRoundScreen for navigation

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookingsScreen(),
    JourneyScreen(),
    VitaRoundScreen(),
    ProfileScreen(), // Add VitaRoundScreen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set background color to black
        selectedItemColor: Colors.blue, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: 'Journey'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Around VIT'), 
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),// VitaRoundScreen
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}