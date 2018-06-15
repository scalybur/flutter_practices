import 'package:flutter/material.dart';
import 'contact_data.dart';

class _ContactListItem extends StatelessWidget
{
  final Contact _contact;

  _ContactListItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: showContact,
      leading: CircleAvatar(
        child: Text(_contact.fullName[0]),
      ),
      title: Text(_contact.fullName),
      subtitle: Text(_contact.email),
    );
  }
}

///////////////////////////////////

class ContactList extends StatelessWidget
{
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 23.3),
      children: _buildContactList(),
    );
  }

  List<_ContactListItem> _buildContactList()
  {
    return _contacts.map((contact) => _ContactListItem(contact))
        .toList();
  }

}

class ContactsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact! (;"),
      ),
      body: ContactList(storedContacts),
    );
  }
}

void showContact()
{
  print("Calling");
}