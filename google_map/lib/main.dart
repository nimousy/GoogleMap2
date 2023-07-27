import 'package:flutter/material.dart';
import 'package:google_map/gmap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding with Hanan',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Coding With Hanan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(
        padding: const EdgeInsets.all(16), 
        child: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text( 
                'Using Google Maps in Flutter', 
                style: TextStyle(fontSize: 42), 
              ),
              SizedBox(height: 20), 
              Text(
                'The google_maps_flutter package is still in the Developers Preview status, so make sure you monitor changes closely when using it. There will likely be breaking changes in the near future.',
                style: TextStyle(fontSize: 20), 
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.map),
        onPressed: () => Navigator.push( 
          context,
          MaterialPageRoute(builder: (context) => GMap()), 
        ), 
      ), 
    );
  }
}
