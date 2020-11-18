import 'package:flutter/material.dart';
import 'package:training/pages/chatroom.dart';
import 'package:training/components/status.dart';
import 'package:training/pages/contacts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChattingApp(),
    ),
  );
}

class ChattingApp extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'CHAT'),
    // Tab(text: 'STATUS'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: null,
            ),
          ],
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            ChatRoom(),
            // Status(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Contacts(), 
            ));
          },
        ),
      ),
    );
  }
}