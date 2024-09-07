// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/media_query.dart';

Widget CorreiosIconeBordaButton(BuildContext context, String text, routePage) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> routePage));
    },
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
          "Seguir",
          style: GoogleFonts.leagueSpartan(
            fontSize: MediaQueryHeight(context) * 0.03,
            color: const Color(0xFF06416A),
            fontWeight: FontWeight.w800
          ),
        ),
        SizedBox(width: MediaQueryWidth(context) * 0.03,),
        Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 3,
                  color: const Color(0xFF06416A),
                )
              ),
              child: const Icon(Icons.arrow_forward, color: Color(0xFF06416A)),
            ),
      ],
    ),
  );
}