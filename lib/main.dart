import 'package:flutter/material.dart';

void main() {
  runApp(
    ShiroyukiApp()
  );
}

class ShiroyukiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShiroyukiHome(),
    );
  }
}

class ShiroyukiHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shiroyuki App')),
      body: Row(
        // Row()'s mainAxisAlignment is Horizontal, meanwhile
        // Column()'s mainAxisAlignment is Vertical
        mainAxisAlignment: MainAxisAlignment.center,
        // If you set the mainAxisSize to MainAxisSize.max, then, the row
        // will set theirself to the fullest. Makes it full-width based on
        // the device's width
        mainAxisSize: MainAxisSize.max,
        // Row()'s crossAxisAlignment is Vertical, meanwhile
        // Column()'s crossAxisAlignment is Horizontal
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlueBox(),
          BiggerBlueBox(),
          BlueBox(),
        ],
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}

class BiggerBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}