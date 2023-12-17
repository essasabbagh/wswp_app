import 'package:flutter/material.dart';
import 'package:wswp_app/widgets/logo.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      // title: const Text('WSWP'),
      title: const Logo(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_rounded),
        )
      ],
    );
  }

  // @override
  // Widget get child => throw UnimplementedError();

  // @override
  // Size get preferredSize => const Size(double.infinity, 50);
}
