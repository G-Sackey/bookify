// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class ourContainer extends StatelessWidget {
  final Widget child;

  const ourContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 1.0,
            )
          ]),
      child: child,
    );
  }
}
