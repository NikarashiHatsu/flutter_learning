import 'package:flutter/material.dart';
import 'package:training/components/message.dart';
import 'package:training/helper/get_message_list.dart';
import 'package:training/model/MessageListModel.dart';

class ChatroomPage extends StatefulWidget {
  final String name;
  
  ChatroomPage({this.name});

  @override
  _ChatroomPageState createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _sendable = false;
  List<MessageListModel> _messages = List<MessageListModel>();

  @override
  void initState() {
    super.initState();
    _messages = getMessageList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: null),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context, index) {
                return Message(
                  name: _messages[index].name,
                  text: _messages[index].chat,
                );
              },
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    onChanged: _handleChanged,
                    decoration: InputDecoration.collapsed(hintText: 'Send a message'),
                    focusNode: _focusNode,
                  ),
                ),
                IconButton(
                  onPressed: () => _handleSubmitted(_textController.text),
                  icon: Icon(
                    Icons.send,
                    color: _sendable
                      ? Theme.of(context).accentColor
                      : null,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleChanged(String text) {
    bool canSend;

    text != ""
      ? canSend = true
      : canSend = false;

    setState(() {
      _sendable = canSend;
    });
  }

  void _handleSubmitted(String text) {
    if(_sendable) {
      _textController.clear();
      MessageListModel message = MessageListModel(
        name: 'HatsuShiroyuki',
        chat: text,
      );

      setState(() {
        _messages.insert(0, message);
      });
      _focusNode.requestFocus();
    }
  }
}