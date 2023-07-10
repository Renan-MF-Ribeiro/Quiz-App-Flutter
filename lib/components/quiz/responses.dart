// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String title;
  final Function() onPress;

  Response(this.title, this.onPress, {super.key});

  final ButtonStyle style = OutlinedButton.styleFrom(
    backgroundColor: Colors.blue,
    primary: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: OutlinedButton(
        onPressed: onPress,
        child: Text(title),
        style: style,
      ),
    );
  }
}
