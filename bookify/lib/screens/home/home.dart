// ignore_for_file: use_build_context_synchronously

import 'package:bookify/screens/root/root.dart';
import 'package:bookify/states/currentuser.dart';
import 'package:bookify/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future _goToNoGroup (BuildContext context)async {
    Navigator.pushNamed(context, 'nogroup');
  }

  Future _signOut (BuildContext context)async{
     CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == 'success') {
      Navigator.pushNamed(context, 'root');
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView (
        children: <Widget>[
          const SizedBox(height: 40,),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: ourContainer(
              child: Column(
                children: [
                  Text(
                    "Harry Potter and the Sorceror's Stone",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[600],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Text("Due in: ",
                        style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                        ),
                       const Text("8 Days",
                         style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: () {}, child: Text("Finished Book", style: TextStyle(color: Colors.white),)),
                ],
              )
              ),
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: ourContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next Book Revealed In: ",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                       Text("22 Hours",
                         style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(50, 50)
              ),
              onPressed: () => _goToNoGroup(context), child: Text("Book Club History", style: TextStyle(color: Colors.black),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              fixedSize: Size(50, 50)
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'chat');
              }, child: Text("Chat", style: TextStyle(color: Colors.black),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.white)),
              fixedSize: const Size(40, 30)
              ),
              onPressed: () => _signOut(context), child: Text("Sign Out", style: TextStyle(color: Colors.white),)),
          ),
        ],
      )
    );
  }
}