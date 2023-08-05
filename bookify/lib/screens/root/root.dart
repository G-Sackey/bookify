import 'package:bookify/screens/home/home.dart';
import 'package:bookify/screens/login/login.dart';
import 'package:bookify/screens/noGroup/noGroup.dart';
import 'package:bookify/screens/splashScreen/splashScreen.dart';
import 'package:bookify/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  notInGroup,
  inGroup
}

class OurRoot extends StatefulWidget {
  const OurRoot({super.key});

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // get the state, check current user and set AuthStatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();
    if (_returnString == 'success') {
      if (_currentUser.getcurrentUser.groupId != null) {
         setState(() {
        _authStatus = AuthStatus.inGroup;
      });
      }
      else{
      setState(() {
        _authStatus = AuthStatus.notInGroup;
      });
    }}
    else{
    setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
  }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal = SizedBox();

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = Splashscreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = OurLogin();
        break;
      case AuthStatus.notInGroup:
        retVal = OurRoot();
        break;
       case AuthStatus.inGroup:
        retVal = HomeScreen();
        break;
      default:
    }

    return retVal;
  }
}
