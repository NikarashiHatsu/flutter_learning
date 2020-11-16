import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  final String _title = 'Shiroyuki News App';
  
  runApp(
    MaterialApp(
      title: _title,
      home: ShiroyukiNewsApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ShiroyukiNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shiroyuki',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Home(),
    );
  }
}