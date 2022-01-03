import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  // int _counter = 0;

  final _keyPlacePicker = GlobalKey<ScaffoldState>();
  List<Marker> markers = [];
  double Lat = 30.0604, Lng = 31.35846561;

  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(Lat, Lng),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Map"),
      ),
      body: GoogleMap(
        key: _keyPlacePicker,
        initialCameraPosition: CameraPosition(
          target: LatLng(30.0604, 31.35846561),
          zoom: 10.00,
        ),
        onMapCreated: _onMapCreated,
        onTap: (pos) {
          print(pos);
          markers.add(
            Marker(
                markerId: MarkerId('3'),
                icon: BitmapDescriptor.defaultMarker,
                position: pos),
          );
        },
        markers: Set<Marker>.from(markers),
      ),
    );
  }
}
