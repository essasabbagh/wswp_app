import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class MainEndDrawer extends StatelessWidget {
  const MainEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select Theme',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CupertinoSegmentedControl<ThemeMode>(
                children: const {
                  ThemeMode.system: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'System',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ThemeMode.light: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Light',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ThemeMode.dark: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Dark',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                },
                padding: EdgeInsets.zero,
                onValueChanged: appProvider.changeTheme,
                groupValue: appProvider.themeMode,
                // selectedColor: Colors.blue, // Customize selected color
                // borderColor: Colors.blue, // Customize border color
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select Languge',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
