import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class location{
  double longitude;
  double latitude;


  Future<void> getLocation() async {
    try{

      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude=position.longitude;
      latitude=position.latitude;
    }
    catch(e){
      print(e);
    }

  }
}