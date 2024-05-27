import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';
import 'package:networking/models/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String city = 'Singapore';
  List<String> cities = [
    'Singapore',
  ];

  Future<Weather> fetchWeather(String city) async {
    const apiKey = '';
    const baseURL = 'https://api.openweathermap.org/data/2.5/weather';

    final response = await http
        .get(Uri.parse('$baseURL?q=$city&appid=$apiKey&units=metric'));

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return Weather.fromjson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: const CircleBorder(),
        onPressed: () async {
          final typedName = await Navigator.pushNamed(context, '/addCity');
          if (typedName != null) {
            try {
              final response = await fetchWeather(typedName.toString());
              if (response != null) {
                setState(() {
                  cities.add(typedName.toString());
                });
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Invalid city. Please enter a valid city.'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        child: const Icon(Icons.add, size: 36.0, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Weather Information', style: kTitleTextStyle),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (dir) {
                        cities.removeAt(index);
                      },
                      child: FutureBuilder<Weather>(
                        future: fetchWeather(cities[index]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final Weather weather = snapshot.data!;
                            return ListTile(
                              leading: Image.network(weather.icon),
                              title: Text(
                                weather.cityName.toUpperCase(),
                                style: kCityTextStyle,
                              ),
                              subtitle: Text(
                                weather.description.toUpperCase(),
                                style: kDescriptionTextStyle,
                              ),
                              trailing: Text(
                                '${weather.temperature}°C | ${weather.humidity}%',
                                style: kResultTextStyle,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            return const ListTile(
                              leading: AspectRatio(
                                aspectRatio: 1, // square aspect ratio
                                child: Center(
                                  child: SizedBox(
                                    height:
                                        50, // adjust the size to your liking
                                    width: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              title: Text(''),
                              subtitle: Text(''),
                              trailing: Text(''),
                            );
                          }
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
