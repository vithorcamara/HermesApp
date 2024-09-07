// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermesapp/pages/cartao_pagamento_page.dart';
import 'package:hermesapp/pages/contrato_pagamento_page.dart';
import 'package:hermesapp/pages/pix_pagamento_page.dart';
import 'package:hermesapp/service/media_query.dart';

class PagamentoPage extends StatefulWidget {
  const PagamentoPage({super.key});

  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF06416A),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: MediaQueryWidth(context) * 0.02,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQueryWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Selecione sua forma\nde pagamento",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              PagamentoButton(context, "Contrato", const ContratoPagamentoPage()),
              PagamentoButton(context, "Pix", const PixPagamentoPage()),
              PagamentoButton(context, "Cartão", const CartaoPagamentoPage()),
              SizedBox(height: MediaQueryHeight(context) * 0.1),
            ],
          ),
        ),
      )
    );
  }
}

Widget PagamentoButton(BuildContext context, String text, routePage) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            50), // Raio dos cantos
      ),
    ),
    child: SizedBox(
      height: MediaQueryHeight(context) * 0.15,
      width: MediaQueryWidth(context) * 0.75,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.leagueSpartan(
            fontSize: MediaQueryHeight(context) * 0.03,
            color: const Color(0xFF06416A),
            fontWeight: FontWeight.w800
          ),
        ),
      ),
    ),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> routePage));
    },
  );
}