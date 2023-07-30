// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:bookify/states/currentuser.dart';
import 'package:bookify/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ourSignUpForm extends StatefulWidget {
  const ourSignUpForm({super.key});

  @override
  State<ourSignUpForm> createState() => _ourSignUpFormState();
}

class _ourSignUpFormState extends State<ourSignUpForm> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
              'Sign Up',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _fullnameController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email), hintText: 'Full Name'),
          ),
          SizedBox(
            height: 20,
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
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open),
                hintText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(
                    _emailController.text, _passwordController.text, context);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _signUpUser(String email, String password, BuildContext context) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

  try {
    if (await _currentUser.signUpUser(email, password)) {
      Navigator.pop(context);
    }
  } catch (e) {
    print(e);
  }
}
