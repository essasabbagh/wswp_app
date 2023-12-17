import 'package:flutter/material.dart';
import 'package:wswp_app/utils/context_ext.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) => Image.asset(
        context.isDark ? 'assets/images/logo_dark.png' : 'assets/images/logo.png',
        height: height,
      );
}
