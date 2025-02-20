import 'package:flutter/material.dart';
import 'package:sign_bridge/profile/edit_profile.dart';
import 'package:sign_bridge/profile/help_center.dart';
import 'package:sign_bridge/profile/notification_screen.dart';
import 'package:sign_bridge/profile/progress_page.dart';
import 'package:sign_bridge/profile/settings.dart';
import 'package:sign_bridge/profile/feedback_page.dart';

class AdvancedProfilePage extends StatelessWidget {
  const AdvancedProfilePage({super.key});

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
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIH3cVN9nVOwezMJZgjRo0YhASylFMo1nJpw&s"),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open image picker
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
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
              _buildProgressCard(context),
              SizedBox(height: 20),
              _buildOptionsCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('75%',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFC107))),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: 0.75,
                backgroundColor: Colors.grey[300],
                color: const Color(0xFFFFC107),
                minHeight: 8,
              ),
            ),
            SizedBox(height: 12),
            Text('Completed 15 out of 20 lessons',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProgressPage()));
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
    );
  }

  Widget _buildOptionsCard(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          _buildProfileOption(Icons.person, 'Edit Profile', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfilePage()));
          }),
          _buildProfileOption(Icons.notifications, 'Notifications', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsPage()));
          }),
          _buildProfileOption(Icons.help, 'Help Center', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HelpCenterPage()));
          }),
          _buildProfileOption(Icons.feedback, 'Feedback', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FeedbackPage()));
          }),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text('Logout', style: TextStyle(color: Colors.redAccent)),
            onTap: () => _showSignOutDialog(context),
          ),
        ],
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

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child:
                  Text('Sign Out', style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }
}
