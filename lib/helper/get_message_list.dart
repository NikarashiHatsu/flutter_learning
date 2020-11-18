import 'package:training/model/MessageListModel.dart';

List<MessageListModel> getMessageList() {

  List<MessageListModel> chatList = List<MessageListModel>();
  MessageListModel chat;

  // 1
  chat = new MessageListModel();
  chat.name = 'HatsuShiroyuki';
  chat.chat = 'How are you?';
  chat.time = DateTime.now();
  chatList.add(chat);

  // 2
  chat = new MessageListModel();
  chat.name = 'HatsuShiroyuki';
  chat.chat = 'Hello';
  chat.time = DateTime.now();
  chatList.add(chat);

  return chatList;
  
}