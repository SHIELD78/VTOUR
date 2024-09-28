import 'package:flutter/material.dart';
import 'Screen/home_screen.dart';
import 'Screen/profile_screen.dart';
import 'Screen/Bookings_screen.dart';
import 'Screen/journey_screen.dart'; 
import 'VitaRoundScreen.dart';  // Import VitaRoundScreen for navigation

class NavigationHomeScreen extends StatefulWidget {
  final String email;  // Accept email as an argument

  const NavigationHomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeScreen(),
      BookingsScreen(),
      JourneyScreen(),
      VitaRoundScreen(),
      ProfileScreen(email: widget.email),  // Pass the email to ProfileScreen
    ];
  }

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
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: 'Journey'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Around VIT'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
