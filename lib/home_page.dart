import 'dart:convert';
import 'package:http/http.dart' as http;
import 'contact.dart';
import 'package:flutter/material.dart';
import 'user_detail_page.dart';


class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com'; // API base URL

  Future<List<Contact>> fetchContacts() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('"Users List"'),
        //backgroundColor: Colors.deepPurpleAccent,
      ),
      body: FutureBuilder<List<Contact>>(
        future: apiService.fetchContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => getRow(context, snapshot.data!, index),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('No Contacts yet..', style: TextStyle(fontSize: 22)));
          } else {
            return const Center(child: Text('No Contacts yet..', style: TextStyle(fontSize: 22)));
          }
        },
      ),
    );
  }

  Widget getRow(BuildContext context, List<Contact> contacts, int index) {
    return Card(
      color: Colors.white70,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name.isNotEmpty ? contacts[index].name[0] : '?',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].phone),
            Text(contacts[index].email),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailPage(contact: contacts[index]),
            ),
          );
        },
      ),
    );
  }
}
