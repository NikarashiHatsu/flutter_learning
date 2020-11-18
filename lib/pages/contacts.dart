import 'package:flutter/material.dart';
import 'package:training/helper/get_contact_list.dart';
import 'package:training/components/contact.dart';
import 'package:training/model/ContactListModel.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  
  // final List<ContactListModel> _contactList = List<ContactListModel>();
  List<ContactListModel> _contacts = [];

  @override
  void initState() {
    super.initState();
    _contacts = getContactList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return Contact(
              name: _contacts[index].name,
              status: _contacts[index].status,
            );
          },
        ),
      ),
    );
  }
}