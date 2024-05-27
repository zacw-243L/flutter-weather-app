import 'package:flutter/material.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 36.0,
  color: Colors.orange,
);

const kCityTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kDescriptionTextStyle = TextStyle(
  fontSize: 16.0,
);

const kResultTextStyle = TextStyle(
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white, size: 30.0),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.black),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
