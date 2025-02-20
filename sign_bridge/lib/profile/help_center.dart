import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MaterialApp(
    home: HelpCenterPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredContacts = contacts;

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    if (await Permission.phone.request().isGranted) {
      final Uri url = Uri.parse("tel:$phoneNumber");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not launch $phoneNumber")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Phone call permission denied")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 225, 207, 1),
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(252, 225, 207, 1),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 100)
                    .animate()
                    .fade(duration: 500.ms)
                    .scale(),
                const SizedBox(height: 10),
                Icon(Icons.support_agent, color: Colors.blue, size: 60)
                    .animate()
                    .fade()
                    .scale(),
                const SizedBox(height: 10),
                Text(
                  "Emergency Support",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: searchController,
                  onChanged: filterContacts,
                  decoration: InputDecoration(
                    hintText: "Search support...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(contact["image"]!),
                    ),
                    title: Text(
                      contact["name"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      contact["role"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey[600]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.call, color: Colors.green, size: 28),
                      onPressed: () => _makePhoneCall(contact["phone"]!),
                    ),
                  ).animate().fade(duration: 500.ms).slideX(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> contacts = [
  {
    "image": "assets/user1.png",
    "name": "Sign Language Interpreter",
    "role": "Available 24/7 for emergency support",
    "phone": "+1234567890"
  },
  {
    "image": "assets/user2.png",
    "name": "Emergency Helpline",
    "role": "Call for urgent assistance",
    "phone": "+0987654321"
  },
  {
    "image": "assets/user3.png",
    "name": "Medical Support",
    "role": "Emergency medical help",
    "phone": "+1122334455"
  },
  {
    "image": "assets/user4.png",
    "name": "Police Assistance",
    "role": "For immediate law enforcement support",
    "phone": "+2233445566"
  },
];
