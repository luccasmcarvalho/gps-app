import 'package:flutter/material.dart';
import 'package:gps/gps.dart';

class GPS extends StatefulWidget {
  @override
  _GPSState createState() => _GPSState();
}

String _latitude;
String _longitude;


void main () async {
  var latlng = await Gps.currentGps();
  
  _latitude = latlng.lat;
  _longitude = latlng.lng;
}



class _GPSState extends State<GPS> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200],
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: <Widget>[
              Text(
              "Sua posição atual está na latitude"+ " " + "$_latitude"+ " " + "e na longitude" + " " + "$_longitude",
              style: TextStyle(fontSize: 26, color: Colors.white),
              ),
          ],
          ),
        ),
        ),
    );
  }
}
