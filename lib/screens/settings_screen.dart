// import 'package:flutter/material.dart';

// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// import 'package:wswp_app/constants/langs.dart';
// import 'package:wswp_app/utils/context_ext.dart';

// import '../generated/l10n.dart';
// import '../providers/app_provider.dart';
// import '../widgets/main_appbar.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appProvider = Provider.of<AppProvider>(context);

//     return Scaffold(
//       // appBar: const MainAppbar(),
//       drawer: const Drawer(),
//       body: Container(
//         decoration: BoxDecoration(
//           color: context.theme.scaffoldBackgroundColor,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 8,
//               color: context.theme.shadowColor.withOpacity(.1),
//             ),
//           ],
//         ),
//         margin: const EdgeInsets.all(16.0),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               // 'Select a Language:',
//               S.of(context).selectLanguage,
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(width: 16),
//             DropdownButton<String>(
//               isExpanded: true, // Make the dropdown full width
//               underline: Container(), // Remove the underline
//               value: appProvider.appLocale.languageCode,
//               items: langs
//                   .map(
//                     (Lang lang) => DropdownMenuItem(
//                       value: lang.code,
//                       child: Row(
//                         children: <Widget>[
//                           SvgPicture.asset(
//                             lang.name,
//                             width: 32,
//                           ),
//                           const SizedBox(width: 10),
//                           const Text('English'),
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//               /*    items: [
//                 DropdownMenuItem(
//                   value: en,
//                   child: Row(
//                     children: <Widget>[
//                       SvgPicture.asset(
//                         english,
//                         width: 32,
//                       ),
//                       const SizedBox(width: 10),
//                       const Text('English'),
//                     ],
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: fr,
//                   child: Row(
//                     children: <Widget>[
//                       SvgPicture.asset(
//                         france,
//                         width: 32,
//                       ),
//                       const SizedBox(width: 10),
//                       const Text('French'),
//                     ],
//                   ),
//                 ),
//               ], */
//               onChanged: (String? lang) =>
//                   appProvider.changeLanguage(Locale(lang ?? '')),
//             ),
//             const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
