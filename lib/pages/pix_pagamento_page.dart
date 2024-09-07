import 'package:flutter/material.dart';
import 'package:hermesapp/pages/concluido.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosButton.dart';
import 'package:hermesapp/widgets/CorreiosIconeBordaButton.dart';

class PixPagamentoPage extends StatefulWidget {
  const PixPagamentoPage({super.key});

  @override
  State<PixPagamentoPage> createState() => _PixPagamentoPageState();
}

class _PixPagamentoPageState extends State<PixPagamentoPage> {
  bool _validacaoPix = false;

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
                "Insira seu\ncartão Correios\nna máquina:",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.qr_code_2,
                size: MediaQueryHeight(context) * 0.2,
              ),
              Text(
                "Ou copie e cole:",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: (){
                  Future.delayed(const Duration(seconds: 5), () => setState(() => _validacaoPix = true));
                },
                child: Text("NDFJSGBFHISHJFDOAHBFAJK"),
              ),
              _validacaoPix != true
              ? CorreiosButton(context, "Aguarde...", const PixPagamentoPage())
              : CorreiosIconeBordaButton(context, "Finalizar", const ConcluidoPage()),
              SizedBox(height: MediaQueryHeight(context) * 0.075)
            ],
          ),
        ),
      ),
    );
  }
}
