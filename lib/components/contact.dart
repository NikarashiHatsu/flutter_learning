import 'package:flutter/material.dart';
import 'package:training/pages/chat_detail.dart';

class Contact extends StatelessWidget {

  final String name;
  final String status;

  Contact({this.name, this.status});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => ChatroomPage(name: name),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100])),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 14.0),
              child: CircleAvatar(child: Text(name[0])
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Divider(height: 6.0),
                Text(status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}