import 'package:flutter/material.dart';
import 'package:flutter_google_maps/convert_latlong_to_address.dart';
import 'package:flutter_google_maps/user_current_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ConverLatLantToAddress(),
    );
  }
}


