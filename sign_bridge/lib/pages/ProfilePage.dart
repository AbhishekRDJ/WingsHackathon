import 'package:flutter/material.dart';

class AdvancedProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFC107),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture with Edit Icon
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                        // Open image picker
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // User Name and Status
              Text(
                'John Doe',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                'Learning Sign Language',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              // Progress Section
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Progress',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('75%',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFFC107))),
                        ],
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey[300],
                        color: const Color(0xFFFFC107),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      SizedBox(height: 12),
                      Text('Completed 15 out of 20 lessons',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressPage()));
                          },
                          child: Text('View Progress'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFC107),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Profile Options with Icons and Navigation
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    _buildProfileOption(Icons.person, 'Edit Profile', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    }),
                    _buildProfileOption(Icons.notifications, 'Notifications',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsPage()));
                    }),
                    _buildProfileOption(Icons.help, 'Help Center', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpCenterPage()));
                    }),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.redAccent),
                      title: Text('Logout',
                          style: TextStyle(color: Colors.redAccent)),
                      onTap: () {
                        // Implement logout functionality
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: const Color(0xFFFFC107)),
          title: Text(title, style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(),
      ],
    );
  }
}

// Dummy pages for navigation
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Center(child: Text("Edit Profile Page")),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Center(child: Text("Notifications Page")),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help Center")),
      body: Center(child: Text("Help Center Page")),
    );
  }
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress")),
      body: Center(child: Text("Progress Page")),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Page")),
    );
  }
}
