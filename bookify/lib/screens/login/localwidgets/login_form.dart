// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:bookify/screens/home/home.dart';
import 'package:bookify/screens/signup/signup.dart';
import 'package:bookify/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../states/currentuser.dart';

class ourLoginForm extends StatefulWidget {
  const ourLoginForm({super.key});

  @override
  State<ourLoginForm> createState() => _ourLoginFormState();
}

class _ourLoginFormState extends State<ourLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString =
          await _currentUser.loginUserWithEmail(email, password);
      if (_returnString == 'success') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ourContainer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email), hintText: 'Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline), hintText: 'Password'),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _loginUser(
                  _emailController.text, _passwordController.text, context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 13),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => OurSignUp()),
                ),
              );
            },
            child: const Text("Don't have an account? Sign Up here"),
          ),
        ],
      ),
    );
  }
}
