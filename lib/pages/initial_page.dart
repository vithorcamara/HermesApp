import 'package:flutter/material.dart';
import 'package:hermesapp/pages/tipo_usuario_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosIconeBordaButton.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQueryWidth(context),
          height: MediaQueryHeight(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundInicio.png'),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/correiosAzulLogo.png'),
              SizedBox(height: MediaQueryHeight(context) * 0.2,),
              Image.asset('assets/images/carteiroInicio.png'),
              Text(
                "Faça seu envio!",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CorreiosIconeBordaButton(context, "Seguir", const TipoUsuarioPage()),
            ],
          ),
          ),
        ),
      );
  }
}