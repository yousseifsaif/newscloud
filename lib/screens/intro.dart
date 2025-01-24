// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../main.dart';

// class splashScreen extends StatefulWidget {
//   const
//   splashScreen({super.key});

//   static const String nameRoute = '/splashScreen';

//   @override
//   State<splashScreen> createState() => _splashScreen();
// }

// class _splashScreen extends State<splashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         const Duration(seconds: 4),
//         () => Navigator.pushReplacementNamed(context, Homepage.pageRoute));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 200),
//             alignment: Alignment.center,
//             child: Image.asset(
//               'assets/images/logoPage.jpeg',
//             ),
//           ),
//           const Divider(
//             indent: 40,
//             endIndent: 40,
//             thickness: 0.5,
//           ),
//           const Text('Developd By Team Error202.'),
//         ],
//       ),
//     );
//   }
// }
