import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/services.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _messageController = TextEditingController();
  String _feedbackType = 'Bug Report'; // Default selection
  bool _isSending = false;

  Future<void> _sendFeedback() async {
    if (_messageController.text.isEmpty) {
      _showSnackbar('⚠️ Please enter your feedback.');
      return;
    }

    setState(() => _isSending = true);
    HapticFeedback.lightImpact(); // Haptic feedback on button press

    final Email email = Email(
      body:
          'Feedback Type: $_feedbackType\n\nMessage:\n${_messageController.text}',
      subject: 'User Feedback - My App',
      recipients: [
        'magaraditya2911@gmail.com'
      ], // 🔹 Replace with your desired email
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      _showSnackbar('✅ Feedback sent successfully!');
      _messageController.clear();
    } catch (error) {
      _showSnackbar('❌ Failed to send feedback: $error');
    } finally {
      setState(() => _isSending = false);
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.brown.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(252, 225, 207, 1), // Warm peach background
      appBar: AppBar(
        title: Text('Feedback',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown.shade900)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.brown.shade900),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Feedback Type",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade900)),
              SizedBox(height: 8),
              Container(
                decoration: _glassEffect(),
                child: DropdownButtonFormField<String>(
                  value: _feedbackType,
                  dropdownColor: Colors.brown.shade100.withOpacity(0.8),
                  style: TextStyle(color: Colors.brown.shade900, fontSize: 16),
                  items: ['Bug Report', 'Feature Request', 'General Feedback']
                      .map((type) => DropdownMenuItem(
                            child: Text(type, style: TextStyle(fontSize: 16)),
                            value: type,
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _feedbackType = value!),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Your Feedback",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade900)),
              SizedBox(height: 8),
              Container(
                decoration: _glassEffect(),
                child: TextField(
                  controller: _messageController,
                  maxLines: 5,
                  style: TextStyle(color: Colors.brown.shade900),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: "Write your feedback here...",
                    hintStyle: TextStyle(color: Colors.brown.shade600),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: _isSending ? null : _sendFeedback,
                  icon: _isSending
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : Icon(Icons.send, size: 20),
                  label: Text(_isSending ? "Sending..." : "Send Feedback",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade700,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _glassEffect() {
    return BoxDecoration(
      color: Colors.brown.shade100.withOpacity(0.8),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.brown.shade300.withOpacity(0.5)),
      boxShadow: [
        BoxShadow(
          color: Colors.brown.shade600.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(2, 2),
        ),
      ],
    );
  }
}
