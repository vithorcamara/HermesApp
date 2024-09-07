import 'package:flutter/material.dart';
import 'package:hermesapp/pages/concluido.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosButton.dart';
import 'package:hermesapp/widgets/CorreiosIconeBordaButton.dart';

class ContratoPagamentoPage extends StatefulWidget {
  const ContratoPagamentoPage({super.key});

  @override
  State<ContratoPagamentoPage> createState() => _ContratoPagamentoPageState();
}

class _ContratoPagamentoPageState extends State<ContratoPagamentoPage> {
  bool _validacaoCodigoBarra = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () => setState(() => _validacaoCodigoBarra = true));
  }

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
              Image.asset('assets/icons/cartaoCorreiosLogo.png'),
              _validacaoCodigoBarra != true
              ? CorreiosButton(context, "Aguarde...", const ContratoPagamentoPage())
              : CorreiosIconeBordaButton(context, "Finalizar", const ConcluidoPage())
            ],
          ),
        ),
      ),
    );
  }
}
