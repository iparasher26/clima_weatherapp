import 'package:clima_weatherapp/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const apiKey = 'd4573e9df4a228298ff1154498006418' ;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    // getLoc();
  }

  void getLoc() async {
    location loc = location();
    await  loc.getLocation();
    latitude = loc.latitude;
    longitude = loc.longitude;

    getData();
  }

  Future getData() async {
    print('\n\n You are inside getData() now!');

    try
    {
      //var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apikey');
      http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=d4573e9df4a228298ff1154498006418'));
       var data = response.body;
       return jsonDecode(data);

      //var decodedData = jsonDecode(response.body);
      //int weather = decodedData(response.body)["weather"][0]["id"];
      //print(weather);
      /*
      print("\n Weather-id is $weather");

      double temperature = decodedData(response.body)["main"]["temp"];
      String country = decodedData(response.body)["sys"]["country"];
      String city=decodedData(response.body)['name'];

      print("\n Temperature of $city,$country is $temperature"); */

    }
    catch (e)
    {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
