// ignore_for_file: use_build_context_synchronously

import 'package:bookify/screens/root/root.dart';
import 'package:bookify/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('This is home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            CurrentUser _currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            String _returnString = await _currentUser.signOut();
            if (_returnString == 'success') {
              Navigator.pushNamed(context, 'root');
            }
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
