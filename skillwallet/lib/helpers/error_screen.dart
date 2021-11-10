import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: const Center(
        child: Text(
          "Problem occur, try again later",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
