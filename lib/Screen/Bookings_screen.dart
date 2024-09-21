import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // Dark app bar
      ),
      body: Center(
        child: Text('Booking Screen', style: TextStyle(color:Colors.white,fontSize: 24)),
      ),
    );
  }
}