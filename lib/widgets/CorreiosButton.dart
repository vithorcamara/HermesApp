// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/media_query.dart';

Widget CorreiosButton(BuildContext context, String text, routePage) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            50), // Raio dos cantos
      ),
    ),
    child: Text(
      text,
      style: GoogleFonts.leagueSpartan(
        fontSize: MediaQueryHeight(context) * 0.03,
        color: const Color(0xFF06416A),
        fontWeight: FontWeight.w800
      ),
    ),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> routePage));
    },
  );
}