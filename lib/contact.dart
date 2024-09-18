class Contact {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String website;
  final String company;

  Contact({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.website,
    required this.company,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'] ?? '',
      address: '${json['address']['street']}, ${json['address']['suite']}, ${json['address']['city']}, ${json['address']['zipcode']}',
      website: json['website'],
      company: '${json['company']['name']}, ${json['company']['catchPhrase']}, ${json['company']['bs']}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
      'website': website,
      'company': company,
    };
  }
}
