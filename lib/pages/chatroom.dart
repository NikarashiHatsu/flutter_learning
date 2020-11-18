import 'package:flutter/material.dart';
import 'package:training/components/chat.dart';
import 'package:training/model/ChatRoomListModel.dart';
import 'package:training/helper/get_chatroom_list.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<ChatRoomListModel> chatList = List<ChatRoomListModel>();

  @override
  void initState() {
    super.initState();
    chatList = getChatList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return Chat(
            name: chatList[index].name,
            lastMessage: chatList[index].lastChat,
            time: chatList[index].time,
          );
        }
      ),
    );
  }
}