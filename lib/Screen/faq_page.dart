import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  final String searchQuery;

  FAQPage({required this.searchQuery});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // FAQs for different cities
  final Map<String, List<Map<String, String>>> faqData = {
    'Pondicherry': [
      {
        'question': 'What is the best time to visit Pondicherry?',
        'answer': 'The best time is from October to March.'
      },
      {
        'question': 'What are the top attractions in Pondicherry?',
        'answer':
            'Top attractions include Auroville, Promenade Beach, and the French Quarter.'
      },
    ],
    'Ooty': [
      {
        'question': 'What is Ooty famous for?',
        'answer':
            'Ooty is famous for its tea gardens, scenic views, and hill stations.'
      },
      {
        'question': 'How to reach Ooty?',
        'answer':
            'You can reach Ooty via train or by road from nearby cities like Coimbatore.'
      },
    ],
    'Bangalore': [
      {
        'question': 'What are some famous places to visit in Bangalore?',
        'answer':
            'Famous places include Lalbagh Garden, Bangalore Palace, and Cubbon Park.'
      },
      {
        'question': 'What is the best time to visit Bangalore?',
        'answer':
            'Bangalore can be visited year-round due to its pleasant climate.'
      },
    ],
    'Coorg': [
      {
        'question': 'What are the popular activities in Coorg?',
        'answer':
            'Popular activities include trekking, coffee plantation tours, and river rafting.'
      },
      {
        'question': 'What is Coorg famous for?',
        'answer':
            'Coorg is known for its lush greenery, coffee plantations, and serene landscapes.'
      },
    ],
    'Chennai': [
      {
        'question': 'What are some must-visit places in Chennai?',
        'answer':
            'Must-visit places include Marina Beach, Kapaleeshwarar Temple, and Fort St. George.'
      },
      {
        'question': 'What is the best time to visit Chennai?',
        'answer':
            'The best time to visit is between November and February to avoid the summer heat.'
      },
    ],
  };

  List<Map<String, String>> filteredFaqs = [];
  bool _faqExpanded = false; // To control FAQ expansion

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqData[widget.searchQuery] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help Desk',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'We’re here to help you with anything on ${widget.searchQuery}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Here you can find answers to frequently asked questions related to ${widget.searchQuery}.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                hintText: 'Search Help',
                hintStyle: TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  filteredFaqs = faqData[widget.searchQuery]!
                      .where((faq) => faq['question']!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
            SizedBox(height: 20),

            // FAQ Section
            Text(
              'FAQ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),

            // FAQs list
            filteredFaqs.isEmpty
                ? Text('No FAQs available for ${widget.searchQuery}',
                    style: TextStyle(color: Colors.black54))
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredFaqs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ExpansionTile(
                            title: Text(
                              filteredFaqs[index]['question']!,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            trailing: Icon(
                              _faqExpanded ? Icons.remove : Icons.add,
                              color: Colors.black,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  filteredFaqs[index]['answer']!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ),
                            ],
                            onExpansionChanged: (expanded) {
                              setState(() {
                                _faqExpanded = expanded;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

            // Bottom section for help
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Still stuck? We\'re just a message away!',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sending a message action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .black, // Use backgroundColor instead of primary
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Send a message',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help & FAQ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
