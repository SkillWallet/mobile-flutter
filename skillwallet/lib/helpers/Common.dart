// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Common {
  static TextStyle textStyle = GoogleFonts.josefinSans(
    color: Colors.white,
    fontSize: 24.0,
  );

  static Widget generateButton(text,
      {VoidCallback? callback, bool inActive = false}) {
    return SizedBox(
      height: 49.0,
      width: 259.0,
      child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              primary: inActive ? Colors.grey : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              side: const BorderSide(
                width: 1.0,
                color: Colors.black,
              )),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:
                Common.textStyle.copyWith(color: Colors.black, fontSize: 14.0),
          )),
    );
  }
}
