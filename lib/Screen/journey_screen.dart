import 'package:flutter/material.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  _JourneyScreenState createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  // List of questions
  final List<String> questions = [
    'How many people (including children) are you planning your trip for?',
    'When do you want to travel?',
    'How long do you want to travel?',
    'What would you like to see?',
    'What is your budget for the trip?',
  ];

  int currentQuestionIndex = 0; // Keep track of the current question
  int selectedPeople = 0; // Default for number of people selection
  String selectedTravelDate = ""; // Store the selected travel time
  String selectedTravelDuration = ""; // Store the selected travel duration
  List<String> selectedDestinations = []; // Store the selected destinations
  double budget = 900; // Default budget value

  // Method to move to the next question
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // If it's the last question, move to a summary screen or final screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(
            people: selectedPeople,
            travelDate: selectedTravelDate,
            travelDuration: selectedTravelDuration,
            destinations: selectedDestinations,
            budget: budget,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set white background for consistency
      appBar: AppBar(
        backgroundColor: Colors.black, // Dark app bar for contrast
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the current question
            Text(
              questions[currentQuestionIndex], // Show the current question
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text for contrast
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),

            // Question 1: Options for the first question (People count)
            if (currentQuestionIndex == 0) ...[
              OptionButton(
                text: '1 person',
                isSelected: selectedPeople == 1,
                onTap: () {
                  setState(() {
                    selectedPeople = 1;
                  });
                },
              ),
              OptionButton(
                text: '2 people',
                isSelected: selectedPeople == 2,
                onTap: () {
                  setState(() {
                    selectedPeople = 2;
                  });
                },
              ),
              OptionButton(
                text: '3 people',
                isSelected: selectedPeople == 3,
                onTap: () {
                  setState(() {
                    selectedPeople = 3;
                  });
                },
              ),
              OptionButton(
                text: '4+ people',
                isSelected: selectedPeople >= 4,
                onTap: () {
                  setState(() {
                    selectedPeople = 4;
                  });
                },
              ),
            ],

            // Question 2: When do you want to travel?
            if (currentQuestionIndex == 1) ...[
              OptionButton(
                text: 'Autumn 2024',
                isSelected: selectedTravelDate == 'Autumn 2024',
                onTap: () {
                  setState(() {
                    selectedTravelDate = 'Autumn 2024';
                  });
                },
              ),
              OptionButton(
                text: 'Winter 2024-2025',
                isSelected: selectedTravelDate == 'Winter 2024-2025',
                onTap: () {
                  setState(() {
                    selectedTravelDate = 'Winter 2024-2025';
                  });
                },
              ),
              OptionButton(
                text: 'Spring 2025',
                isSelected: selectedTravelDate == 'Spring 2025',
                onTap: () {
                  setState(() {
                    selectedTravelDate = 'Spring 2025';
                  });
                },
              ),
              OptionButton(
                text: 'Summer 2025',
                isSelected: selectedTravelDate == 'Summer 2025',
                onTap: () {
                  setState(() {
                    selectedTravelDate = 'Summer 2025';
                  });
                },
              ),
              OptionButton(
                text: 'Later',
                isSelected: selectedTravelDate == 'Later',
                onTap: () {
                  setState(() {
                    selectedTravelDate = 'Later';
                  });
                },
              ),
            ],

            // Continue Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue background for button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded edges
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                if (currentQuestionIndex == 0 && selectedPeople == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please select the number of people.',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  // Go to the next question
                  nextQuestion();
                }
              },
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish'
                    : 'Next', // Change button text to "Finish" on the last question
                style: const TextStyle(
                  color: Colors.white, // White text
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300], // Selected and unselected button color
          foregroundColor: Colors.black, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded edges
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

// Summary Screen

class SummaryScreen extends StatelessWidget {
  final int people;
  final String travelDate;
  final String travelDuration;
  final List<String> destinations;
  final double budget;

  const SummaryScreen({
    super.key,
    required this.people,
    required this.travelDate,
    required this.travelDuration,
    required this.destinations,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Summary of Your Journey',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'People: $people',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Travel Date: $travelDate',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Duration: $travelDuration',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Destinations: ${destinations.join(', ')}',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              'Budget: \$${budget.round()} per person',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
