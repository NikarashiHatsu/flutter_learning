import 'package:flutter/material.dart';
import 'package:training/pages/chat_detail.dart';

class Chat extends StatelessWidget {
  final String name;
  final String lastMessage;
  final DateTime time;
  Chat({this.name, this.lastMessage, this.time});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChatroomPage(name: name)
        ));
      },
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Text(name[0]),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 14.0),
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${time.hour}:${time.minute}",
            ),
          ],
        ),
      ),
    );
  }
}