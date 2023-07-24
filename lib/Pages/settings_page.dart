import 'package:flutter/material.dart';
import 'package:siddhivinayak_app/Common%20functions/mythemes.dart';
import 'package:provider/provider.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  State<MySettings> createState() => _SettingsState();
}

class _SettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text('Language'),
            ),
            const Divider(),
            ListTile(
                title: const Text('Theme'),
                trailing: Switch.adaptive(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.changeTheme(value);
                    })),
            const Divider()
          ],
        ));
  }
}
