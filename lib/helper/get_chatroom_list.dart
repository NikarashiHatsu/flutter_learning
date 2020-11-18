import 'package:training/model/ChatRoomListModel.dart';

List<ChatRoomListModel> getChatList() {

  List<ChatRoomListModel> chatLists = List<ChatRoomListModel>();
  ChatRoomListModel chat;

  // 1
  chat = new ChatRoomListModel();
  chat.name = 'Aghits Nidallah';
  chat.lastChat = 'Testing';
  chat.time = DateTime.now();
  chatLists.add(chat);

  // 2
  chat = new ChatRoomListModel();
  chat.name = 'Kevin Valenciano Pandelaki';
  chat.lastChat = 'Njirs';
  chat.time = DateTime.now();
  chatLists.add(chat);

  // 3
  chat = new ChatRoomListModel();
  chat.name = 'Aula Nur Rizal Ardiyantoro';
  chat.lastChat = 'A';
  chat.time = DateTime.now();
  chatLists.add(chat);

  // 4
  chat = new ChatRoomListModel();
  chat.name = 'Taufik Imam Pramono';
  chat.lastChat = 'Koh, Hoe Tang';
  chat.time = DateTime.now();
  chatLists.add(chat);

  // 5
  chat = new ChatRoomListModel();
  chat.name = 'Shikikanjut';
  chat.lastChat = 'Itu Kisaragi lu diewe ama Ark Royal njir, kesini cepet';
  chat.time = DateTime.now();
  chatLists.add(chat);
  
  return chatLists;

}