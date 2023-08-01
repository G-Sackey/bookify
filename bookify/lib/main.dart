import 'dart:ffi';

import 'package:bookify/firebase_options.dart';
import 'package:bookify/screens/home/home.dart';
import 'package:bookify/screens/login/login.dart';
import 'package:bookify/screens/root/root.dart';
import 'package:bookify/screens/signup/localwidgets/signup_form.dart';
import 'package:bookify/states/currentuser.dart';
import 'package:bookify/utils/ourtheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: const OurRoot(),
        routes: {
          'root': (context) => OurRoot(),
          'home': (context) => HomeScreen(),
        },
      ),
    );
  }
}

currentUser() {}
