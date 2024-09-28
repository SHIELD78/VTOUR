import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant-detail';

  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No details available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']!),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(args['image']!, width: double.infinity, height: 250.0, fit: BoxFit.cover),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                args['description']!,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}