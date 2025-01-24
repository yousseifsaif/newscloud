import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/mood_provider.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // State variables for settings
  final bool _darkMode = false;
  String _language = 'Arabic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Dark mode toggle
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<MoodProvider>(context,listen: false).changMode();
                  },
                  icon: const Icon(Icons.dark_mode),
                  label: const Text('Dark Mode'),
                )),
              ]),
          // Language dropdown
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _language,
              items: ['Arabic','English', 'Spanish', 'French']
                  .map((lang) => DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _language = value!;
                });
              },
            ),
          ),
          // Notifications option
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to notifications settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationSettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Notification Settings Page
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: const Center(
        child: Text(
          'Notification settings content goes here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
void _saveDarkMode(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('darkMode', value);
}

Future<bool> _loadDarkMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('darkMode') ?? false; // Default is false
}