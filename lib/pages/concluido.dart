import 'package:flutter/material.dart';
import 'package:hermesapp/pages/initial_page.dart';
import 'package:hermesapp/service/media_query.dart';

class ConcluidoPage extends StatefulWidget {
  const ConcluidoPage({super.key});

  @override
  State<ConcluidoPage> createState() => _ConcluidoPageState();
}

class _ConcluidoPageState extends State<ConcluidoPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const InitialPage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQueryWidth(context),
          height: MediaQueryHeight(context),
          decoration: const BoxDecoration(
            color: Color(0xFF06416A),
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundConcluido.png'),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQueryHeight(context) * 0.1),
              Text(
                "Obrigado!",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.05,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Text(
                "Dirija-se ao balcão\npara a validação\ndo atendente.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.03,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Image.asset('assets/icons/correiosAmareloLogo.png')
            ],
          ),
          ),
        ),
      );

  }
}

