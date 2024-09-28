import 'package:flutter/material.dart';
import 'navigation_home_screen.dart';  // Import the main navigation screen
import 'VitaRoundScreen.dart';  // Import VitaRoundScreen
import 'RestaurantDetailScreen.dart' as restaurant;  // Alias RestaurantDetailScreen as restaurant
import 'login_screen.dart';  // Import the login screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VTour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',  // Set the initial route to the login screen
      routes: {
        '/login': (context) => const LoginScreen(),  // Login screen route
      },
      // Dynamic routing: after login, navigate to home with email
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          final args = settings.arguments as String?;  // Use String? to avoid the null error
          if (args != null) {  // Check if args is not null before using it
            return MaterialPageRoute(
              builder: (context) {
                return NavigationHomeScreen(email: args);  // Pass email to NavigationHomeScreen
              },
            );
          } else {
            // If no email is passed, redirect back to the login screen or handle error
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
          }
        }
        return null;
      },
    );
  }
}
