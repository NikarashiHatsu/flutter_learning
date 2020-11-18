import 'package:training/model/ContactListModel.dart';

List<ContactListModel> getContactList() {

  List<ContactListModel> _contactList = List<ContactListModel>();
  ContactListModel _contact;

  // 1
  _contact = new ContactListModel();
  _contact.name = 'Aghits Nidallah';
  _contact.status = 'Hello!';
  _contactList.add(_contact);

  // 2
  _contact = new ContactListModel();
  _contact.name = 'Muhammad Ahmadin';
  _contact.status = 'Hello!';
  _contactList.add(_contact);

  // 3
  _contact = new ContactListModel();
  _contact.name = 'Ade Iyas Kuryasin';
  _contact.status = 'Hello!';
  _contactList.add(_contact);

  return _contactList;

  
}