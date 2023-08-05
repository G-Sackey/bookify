import 'package:bookify/screens/createGroup/createGroup.dart';
import 'package:bookify/screens/joinGroup/joinGroup.dart';
import 'package:flutter/material.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({super.key});

  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => JoinGroup()));
    }

    void _goToCreate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroup()));
    }

    return Scaffold(
      body: Column(children: [
        Spacer(flex: 1,),
         Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/logo.png"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Welcome to BOOKIFY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Since you are not in a club, you can select either " +
                  "to join a club or create a club.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(
            flex: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),),
                  fixedSize: Size(80, 80),
                  side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                  ), onPressed: () {
                    _goToCreate(context);
                  }, child:const Text('Create',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  )),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),),
                  fixedSize: Size(80, 80),
                  side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),),
                  onPressed: () {
                    _goToJoin(context);
                  }, child: const Text('Join', 
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
            ]),
            ),
      ])
    );
  }
}