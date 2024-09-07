import 'package:flutter/material.dart';
import 'package:hermesapp/pages/pagamento_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosButton.dart';
import 'package:hermesapp/widgets/CorreiosIconeBordaButton.dart';

class CodigoBarrasPage extends StatefulWidget {
  const CodigoBarrasPage({super.key});

  @override
  State<CodigoBarrasPage> createState() => _CodigoBarrasPageState();
}

class _CodigoBarrasPageState extends State<CodigoBarrasPage> {
  bool _validacaoCodigoBarra = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () => setState(() => _validacaoCodigoBarra = true));
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Seu código de barras\nestá a caminho...",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Icon(
                Icons.barcode_reader,
                size: MediaQueryHeight(context) * 0.25,
                color: const Color(0xFF06416A),
              ),
              const SizedBox(height: 20),
              _validacaoCodigoBarra != true
              ? CorreiosButton(context, "Aguarde...", const CodigoBarrasPage())
              : CorreiosIconeBordaButton(context, "Prossiga", const PagamentoPage())
            ],
          ),
        ),
      ),
    );
  }
}
