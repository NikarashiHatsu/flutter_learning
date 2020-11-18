import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String username;
  final String password;

  AddUser({this.username, this.password});
  
  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    void showSuccessToast(BuildContext context) {
      final scaffold = Scaffold.of(context);
      final snackbar = SnackBar(
        content: Text(
          'User added',
          style: TextStyle(
            color: Colors.greenAccent,
          ),
        ),
      );
      scaffold.showSnackBar(snackbar);
    }

    void showFailedToast(BuildContext context, errMsg) {
      final scaffold = Scaffold.of(context);
      final snackbar = SnackBar(
        content: Text(
          'Failed to add user: {$errMsg}.',
          style: TextStyle(
            color: Colors.greenAccent,
          ),
        ),
      );
      scaffold.showSnackBar(snackbar);
    }

    Future<void> addUser() {
      return users
        .add({
          'username': username,
          'password': password
        })
        .then((value) => showSuccessToast(context))
        .catchError((error) => showFailedToast(context, error));
    }
    
    return FloatingActionButton(
      onPressed: addUser,
      child: Icon(Icons.person_add),
    );
  }
}