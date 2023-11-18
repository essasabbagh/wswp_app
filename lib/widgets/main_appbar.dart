import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget{
  const MainAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      // title: const Text('WSWP'),
      title: Image.asset(
        'assets/images/logo.png',
        height: 60,
      ),
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
