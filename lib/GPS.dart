import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class GPS extends StatefulWidget {
  @override
  _GPSState createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  Geolocator geolocator = Geolocator();

  Position userLocation;
  void initState() {
    super.initState();
    _getLocation().then((position) {
      userLocation = position;
    });
  }

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
              userLocation == null
                  ? CircularProgressIndicator()
                  : Text(
                      "Sua posição atual está na latitude" +
                          " " +
                          userLocation.latitude.toString() +
                          " " +
                          "e na longitude" +
                          " " +
                          userLocation.longitude.toString(),
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _getLocation().then((value) {
                      setState(() {
                        userLocation = value;
                      });
                    });
                  },
                  color: Colors.lightGreenAccent[300],
                  child: Text(
                    "Buscar Localização",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
