import 'package:flutter/material.dart';
import 'contact.dart';

class UserDetailPage extends StatelessWidget {
  final Contact contact;

  const UserDetailPage({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        backgroundColor: Colors.deepPurpleAccent
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurpleAccent.shade100,
              child: Text(
                contact.name[0].toUpperCase(),
                style: TextStyle(fontSize: 40, color: Colors.deepPurpleAccent.shade700),
              ),
            ),
            SizedBox(height: 16),
            Text(
              contact.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '@${contact.username}',
              style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent.shade700),
            ),
            SizedBox(height: 24),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.deepPurpleAccent),
                subtitle: Text('Email'),
                title: Text(contact.email),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.deepPurpleAccent),
                subtitle: Text('Phone'),
                title: Text(contact.phone),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.deepPurpleAccent),
                subtitle: Text('Address'),
                title: Text(contact.address),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.web, color: Colors.deepPurpleAccent),
                subtitle: Text('Website'),
                title: Text(contact.website),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.business, color: Colors.deepPurpleAccent),
                subtitle: Text('Company'),
                title: Text(contact.company),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
