import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Orlando"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.mapMarkerAlt), onPressed: () {}),
        ],
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(28.538336, -81.379234),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/carlosblancorocks/cjzjzc28c5eha1cmgkynbvthp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2FybG9zYmxhbmNvcm9ja3MiLCJhIjoiY2p6anpneWgwMGZsMTNtb2FkdG5lMWJuOCJ9.m1qgEebj2nlXNHJxkk8XtA",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiY2FybG9zYmxhbmNvcm9ja3MiLCJhIjoiY2p6anpneWgwMGZsMTNtb2FkdG5lMWJuOCJ9.m1qgEebj2nlXNHJxkk8XtA',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(28.538336, -81.379234),
                builder: (ctx) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('yeahaa');
                        },
                      ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
