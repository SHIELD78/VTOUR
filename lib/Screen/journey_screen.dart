import 'package:flutter/material.dart';

class JourneyScreen extends StatefulWidget {
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
      backgroundColor: Colors.black, // Set dark background
      appBar: AppBar(
        title: Text(
          'Plan Your Journey',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // Dark app bar
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
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),

            // Options for the first question (People count) only
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

            // Question 3: How long do you want to travel?
            if (currentQuestionIndex == 2) ...[
              OptionButton(
                text: '1 week',
                isSelected: selectedTravelDuration == '1 week',
                onTap: () {
                  setState(() {
                    selectedTravelDuration = '1 week';
                  });
                },
              ),
              OptionButton(
                text: '2 weeks',
                isSelected: selectedTravelDuration == '2 weeks',
                onTap: () {
                  setState(() {
                    selectedTravelDuration = '2 weeks';
                  });
                },
              ),
              OptionButton(
                text: '3-4 weeks',
                isSelected: selectedTravelDuration == '3-4 weeks',
                onTap: () {
                  setState(() {
                    selectedTravelDuration = '3-4 weeks';
                  });
                },
              ),
              OptionButton(
                text: '5+ weeks',
                isSelected: selectedTravelDuration == '5+ weeks',
                onTap: () {
                  setState(() {
                    selectedTravelDuration = '5+ weeks';
                  });
                },
              ),
            ],

            // Question 4: What would you like to see?
            if (currentQuestionIndex == 3) ...[
              DestinationOption(
                text: 'Sydney',
                isSelected: selectedDestinations.contains('Sydney'),
                onTap: () {
                  setState(() {
                    selectedDestinations.contains('Sydney')
                        ? selectedDestinations.remove('Sydney')
                        : selectedDestinations.add('Sydney');
                  });
                },
              ),
              DestinationOption(
                text: 'Great Barrier Reef',
                isSelected: selectedDestinations.contains('Great Barrier Reef'),
                onTap: () {
                  setState(() {
                    selectedDestinations.contains('Great Barrier Reef')
                        ? selectedDestinations.remove('Great Barrier Reef')
                        : selectedDestinations.add('Great Barrier Reef');
                  });
                },
              ),
              DestinationOption(
                text: 'Uluru',
                isSelected: selectedDestinations.contains('Uluru'),
                onTap: () {
                  setState(() {
                    selectedDestinations.contains('Uluru')
                        ? selectedDestinations.remove('Uluru')
                        : selectedDestinations.add('Uluru');
                  });
                },
              ),
              DestinationOption(
                text: 'Great Ocean Road',
                isSelected: selectedDestinations.contains('Great Ocean Road'),
                onTap: () {
                  setState(() {
                    selectedDestinations.contains('Great Ocean Road')
                        ? selectedDestinations.remove('Great Ocean Road')
                        : selectedDestinations.add('Great Ocean Road');
                  });
                },
              ),
            ],

            // Question 5: What is your budget for the trip?
            if (currentQuestionIndex == 4) ...[
              Slider(
                value: budget,
                min: 900,
                max: 5100,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    budget = value;
                  });
                },
                label: '\$${budget.round()}',
              ),
              Text(
                'Budget per person: \$${budget.round()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],

            SizedBox(height: 30.0),

            // Continue Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800], // Grey background for button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded edges
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                if (currentQuestionIndex == 0 && selectedPeople == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
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
                style: TextStyle(
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
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.grey[800]
              : Colors.grey[850], // Dark grey shades
          foregroundColor: Colors.white, // White text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded edges
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

class DestinationOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const DestinationOption({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.grey[800]
              : Colors.grey[850], // Dark grey shades
          foregroundColor: Colors.white, // White text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded edges
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
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
    Key? key,
    required this.people,
    required this.travelDate,
    required this.travelDuration,
    required this.destinations,
    required this.budget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Summary of Your Journey',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'People: $people',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Travel Date: $travelDate',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Duration: $travelDuration',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Destinations: ${destinations.join(', ')}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Budget: \$${budget.round()} per person',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Journey Summary Completed.');
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}