

import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget implements PreferredSize {
  const MainAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('WSWP'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_rounded),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 40);
}
