import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  final String email;  // Email passed from login

  const ProfileScreen({Key? key, required this.email}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Update the backend URL for Android Emulator
  final String backendUrl = 'http://10.0.2.2:3000/profile';  // Change localhost to 10.0.2.2 for Android emulator

  String _fullName = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _maritalStatus = '';
  String _city = '';
  String _state = '';
  String _nationality = '';
  String _mobileNumber = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _email = widget.email;  // Initialize the email passed from login
    _fetchProfile();         // Fetch profile data on load
  }

  // Function to fetch profile data from the backend
  Future<void> _fetchProfile() async {
    try {
      final response = await http.get(Uri.parse(backendUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _fullName = data['fullName'] ?? '';
          _dateOfBirth = data['dateOfBirth'] ?? '';
          _gender = data['gender'] ?? '';
          _maritalStatus = data['maritalStatus'] ?? '';
          _city = data['city'] ?? '';
          _state = data['state'] ?? '';
          _nationality = data['nationality'] ?? '';
          _mobileNumber = data['mobileNumber'] ?? '';
          _email = data['email'] ?? widget.email;  // Fallback to passed email
        });
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (error) {
      print('Error fetching profile: $error');
    }
  }

  // Function to save profile data to the backend
  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final body = json.encode({
        'fullName': _fullName,
        'dateOfBirth': _dateOfBirth,
        'gender': _gender,
        'maritalStatus': _maritalStatus,
        'city': _city,
        'state': _state,
        'nationality': _nationality,
        'mobileNumber': _mobileNumber,
        'email': _email,  // Include email
      });

      try {
        final response = await http.post(
          Uri.parse(backendUrl),
          headers: {"Content-Type": "application/json"},
          body: body,
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile saved successfully')),
          );
        } else {
          throw Exception('Failed to save profile');
        }
      } catch (error) {
        print('Error saving profile: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: _saveProfile,  // Save profile when "SAVE" is clicked
            child: const Text(
              'SAVE',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GENERAL DETAILS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              _buildEditableTextField('FULL NAME', 'Enter full name', (value) => _fullName = value),
              Row(
                children: [
                  Expanded(child: _buildEditableTextField('DATE OF BIRTH', 'Enter DOB', (value) => _dateOfBirth = value)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildEditableTextField('GENDER', 'Enter gender', (value) => _gender = value)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildEditableTextField('MARITAL STATUS', 'Enter status', (value) => _maritalStatus = value)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildEditableTextField('ANNIVERSARY DATE', 'Optional', (value) => {})),
                ],
              ),
              _buildEditableTextField('CITY', 'Enter city', (value) => _city = value),
              _buildEditableTextField('STATE', 'Enter state', (value) => _state = value),
              _buildEditableTextField('NATIONALITY', 'Enter nationality', (value) => _nationality = value),
              const SizedBox(height: 20),
              const Text(
                'CONTACT DETAILS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              _buildEditableTextField('MOBILE NO.', 'Enter mobile number', (value) => _mobileNumber = value),
              _buildNonEditableTextField('EMAIL ID', _email, isVerified: true),  // Email cannot be edited
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableTextField(String label, String hint, Function(String) onSaved) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(hintText: hint, border: const OutlineInputBorder()),
          onSaved: (value) => onSaved(value!),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildNonEditableTextField(String label, String value, {bool isVerified = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: isVerified ? const Icon(Icons.verified, color: Colors.green) : null,
          ),
          enabled: false,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
