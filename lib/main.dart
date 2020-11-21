import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App bar')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
              elevation: 5.0,
            ),
          ),
          Card(
            child: Text('LIST OF TXs'),
            elevation: 5.0,
          ),
        ],
      ),
    );
  }
}
