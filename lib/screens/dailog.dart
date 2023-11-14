import 'package:flutter/material.dart';

import '../constants/langs.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String selectedLangCode = 'en'; // Default language code

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Language'),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField(
            value: selectedLangCode,
            items: langs.map((lang) {
              return DropdownMenuItem(
                value: lang['code'],
                child: Row(
                  children: [
                    Text(lang.emoji),
                    const SizedBox(width: 8.0),
                    Text(lang.name),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedLangCode = value.toString();
              });
            },
            decoration: const InputDecoration(
              labelText: 'Language',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle submit button click here
              print('Selected Language Code: $selectedLangCode');
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}

// Usage in your main widget or screen
void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const LanguageDialog();
    },
  );
}
