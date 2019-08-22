import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

Widget myDetailsContainer1(String restaurantName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          restaurantName,
          style: TextStyle(
              color: Color(0xff6200ee),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      SizedBox(height: 5.0),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Text(
            "4.1",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStarHalf,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
              child: Text(
            "(946)",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )),
        ],
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
        ),
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "Closed \u00B7 Opens 17:00 Thu",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Widget _boxes(String _image, double lat, double long, String restaurantName) {
  return GestureDetector(
    onTap: () {
      // to do: _gotolocation
    },
    child: Container(
      child: new FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 180,
                height: 200,
                child: ClipRRect(
                  borderRadius: new BorderRadius.circular(24.0),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(_image),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myDetailsContainer1(restaurantName),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildContainer() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // to do -> add _boxes
          ),
        ],
      ),
    ),
  );
}

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
                point: new LatLng(51.5, -0.09),
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
