import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:training/pages/chatroom.dart';
import 'package:training/pages/contacts.dart';
import 'package:training/pages/loading.dart';

import 'package:training/firestore/add_user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirestoreApp());
}

class FirestoreApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if(snapshot.hasError) {
          // return SomethingWentWrong();
        }

        // Once complete, show the app
        if(snapshot.connectionState == ConnectionState.done) {
          return TheTrueApp();
        }

        // Otherwise, show loading page
        return Loading();
      },
    );
  }
}

class TheTrueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChattingApp(),
    );
  }
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
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.chat),
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(
        //       builder: (context) => Contacts(), 
        //     ));
        //   },
        // ),
        // floatingActionButton: AddUser(
        //   username: 'HatsuShiroyuki',
        //   password: 'Shiroyuki',
        // ),
      ),
    );
  }
}