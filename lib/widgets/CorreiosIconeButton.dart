// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/media_query.dart';

Widget CorreiosIconeButton(BuildContext context, String text, routePage, IconData? icone) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            50), // Raio dos cantos
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.leagueSpartan(
            fontSize: MediaQueryHeight(context) * 0.03,
            color: const Color(0xFF06416A),
            fontWeight: FontWeight.w800
          ),
        ),
        SizedBox(width: MediaQueryWidth(context) * 0.03,),
        Icon(icone, color: const Color(0xFF06416A)),
      ]
    ),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> routePage));
    },
  );
}