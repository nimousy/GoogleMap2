import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

class GMap extends StatefulWidget {
  const GMap({super.key});

  @override
  State<GMap> createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  final Set<Marker> _markers = HashSet<Marker>();
  final Set<Polygon> _polygons = HashSet<Polygon>();
  final Set<Polyline> _polylines = HashSet<Polyline>();
  final Set<Circle> _circles = HashSet<Circle>();

  GoogleMapController? _mapController;
  BitmapDescriptor? _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygons();
    _setPolylines();
    _setCircles();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/noodle_icon.png');
  }

  void _setMapStyle(GoogleMapController controller) async  {
    String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    controller.setMapStyle(style);
  }

  void _setPolygons(){
  List<LatLng> polygonLatLongs = [];
    polygonLatLongs.add(LatLng(37.78493, -122.42932));
    polygonLatLongs.add(LatLng(37.78693, -122.41942));
    polygonLatLongs.add(LatLng(37.78923, -122.41542));
    polygonLatLongs.add(LatLng(37.78923, -122.42582));

    _polygons.add(
      Polygon(
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
        fillColor: Colors.white,
        strokeWidth: 1, 
      ),
    );
}

void _setPolylines(){
  List<LatLng> polylineLatLongs = [];
  polylineLatLongs.add(LatLng(37.74493, -122.42932));
  polylineLatLongs.add(LatLng(37.74693, -122.41942));
  polylineLatLongs.add(LatLng(37.74923, -122.41542));
  polylineLatLongs.add(LatLng(37.74923, -122.42582));
  

  _polylines.add(
    Polyline(
      polylineId: PolylineId("0"),
      points: polylineLatLongs,
      color: Colors.purple,
      width: 1,
      ),
   );
}

void _setCircles(){
  _circles.add(
    Circle(
      circleId: CircleId("0"),
      center: LatLng(37.76493, -122.42432),
      radius: 1000,
      strokeWidth: 2, 
      fillColor: Color.fromRGBO(102, 51, 153, .5)
    ),
  );
}

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("0"),
            position: LatLng(37.77483, -122.41942),
            infoWindow: InfoWindow(
              title: "San Francsico",
              snippet: "An Interesting city",
            ),
            icon: _markerIcon ?? BitmapDescriptor.defaultMarker,
            ),
      );
    });
    _setMapStyle(controller);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'), 
      ),
      body: Stack(children: <Widget>[
         GoogleMap(
          onMapCreated: _onMapCreated, 
          initialCameraPosition: CameraPosition(
          target: LatLng(37.77483, -122.41942), 
          zoom: 12, 
          ),
          markers: _markers,
          polygons: _polygons,
          polylines: _polylines,
          circles: _circles,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
         ),
         Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 80), 
          child: const Text("Coding With Hanan"),
         )
      ],
      ),
       
    );
  }
}








