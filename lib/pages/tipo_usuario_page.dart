import 'package:flutter/material.dart';
import 'package:hermesapp/pages/checagem_page.dart';
import 'package:hermesapp/pages/dados_remetente_page.dart';
import 'package:hermesapp/pages/initial_page.dart';
import 'package:hermesapp/pages/pacote_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosIconeButton.dart';

class TipoUsuarioPage extends StatefulWidget {
  const TipoUsuarioPage({super.key});

  @override
  State<TipoUsuarioPage> createState() => _TipoUsuarioPageState();
}

class _TipoUsuarioPageState extends State<TipoUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQueryWidth(context),
          height: MediaQueryHeight(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundTipoUsuario.png'),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "O que você deseja\nhoje?",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQueryHeight(context) * 0.1),
              CorreiosIconeButton(context, "Envio", const PacotePage(), Icons.send_and_archive),
              SizedBox(height: MediaQueryHeight(context)*0.05,),
              CorreiosIconeButton(context, "Checagem", const ChecagemPage(), Icons.search),
            ],
          ),
          ),
        ),
      );
  }
}