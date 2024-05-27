import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({Key? key}) : super(key: key);

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  TextEditingController cityController = TextEditingController();

  List<String> cities = [
    'Singapore',
    'Kuala Lumpur',
    'Phnom Penh',
    'Manila',
    'Jakarta',
    'Hanoi',
    'Tokyo',
    'Kyoto',
    'Seoul',
    'Bangkok',
    'Taipei',
    'Taichung',
    'Beijing',
    'Manila',
    'London',
    'Paris',
    'Oslo',
    'Osaka',
    'Berlin',
    'Stockholm',
    'Helsinki',
    'Madrid',
    'Bern',
    'Dublin',
    'Washington',
    'Incheon',
    'Yuchi',
    'Nara',
    'Nagoya',
    'Nagasaki',
    'Rome',
    'Nantong',
  ];
  String _selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: kTextFieldInputDecoration.copyWith(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                      right: 10), // Add some margin to the right
                  child: Autocomplete<String>(
                    optionsBuilder: (value) {
                      // When the field is empty
                      if (value.text.isEmpty) {
                        return [];
                      }
                      return cities.where(
                        (item) => item
                            .toLowerCase()
                            .contains(value.text.toLowerCase()),
                      );
                    },
                    onSelected: (value) {
                      setState(() {
                        _selectedCity = value;
                        cityController.text =
                            value; // Set the text of the textfield to the selected city
                      });
                    },
                  ),
                ),
              ),
              controller: cityController,
            ),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context, _selectedCity),
                child: Text('Get weather', style: kButtonTextStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
