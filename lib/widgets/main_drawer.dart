import 'package:flutter/material.dart';
import 'package:wswp_app/utils/context_ext.dart';
import 'package:wswp_app/widgets/logo.dart';

import 'about_dialog.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: context.height,
        child: Column(
          children: <Widget>[
            // Header with Logo and Slogan
            const DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // FlutterLogo(size: 50),
                  Logo(height: 100),
                  Text(
                    'We Stand With Palestain',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // List of Links
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Home'),
              onTap: () {
                // Handle onTap for Link 1
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About'),
              onTap: () {
                context.popFalse();
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AppInfoDialog(); // Display the app info dialog
                  },
                );
              },
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text(
                'Free palestine 🇵🇸',
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.grey,
                ),
              ),
            ),
            // Footer with App Version
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'App Version 1.0.1',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
