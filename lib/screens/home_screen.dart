import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wswp_app/utils/context_ext.dart';

import '../providers/app_provider.dart';
import '../widgets/main_end_drawer.dart';
import '../widgets/main_drawer.dart';
import '../widgets/result_section.dart';
import '../widgets/search_input.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      drawer: const MainDrawer(),
      endDrawer: const MainEndDrawer(),
      body: NestedScrollView(
        controller: appProvider.scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: const [SizedBox()], // this will hide endDrawer hamburger icon
              pinned: true,
              // snap: true,
              floating: true,
              // stretch: true,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 150,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _key.currentState!.openDrawer, // <-- Opens drawer,
                    child: const Icon(
                      Icons.menu_rounded,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: innerBoxIsScrolled ? 0 : 1,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceOut,
                    child: Image.asset(
                      context.isDark
                          ? 'assets/images/logo_dark.png'
                          : 'assets/images/logo.png',
                      height: 60,
                    ),
                  ),
                  GestureDetector(
                    onTap: _key.currentState!.openEndDrawer,
                    child: const Icon(Icons.settings_rounded),
                  ),
                ],
              ),
              bottom: const SearchInput(),
            ),
          ];
        },
        body: const ResultSection(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.qr_code),
      //   onPressed: () {},
      // ),
    );
  }
}
