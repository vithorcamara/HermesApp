// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hermesapp/pages/dados_destinatario_page.dart';
import 'package:hermesapp/service/media_query.dart';

class DadosRemetentePage extends StatefulWidget {
  const DadosRemetentePage({super.key});

  @override
  _DadosRemetentePageState createState() => _DadosRemetentePageState();
}

class _DadosRemetentePageState extends State<DadosRemetentePage> {
  final _cpfController = TextEditingController();

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
          height: MediaQueryHeight(context),
          width: MediaQueryWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQueryHeight(context)*0.1,),
              Text(
                "Insira seus dados",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 5,
                    color: const Color(0xFF06416A),
                  )
                ),
                child: Icon(
                  Icons.person_outline,
                  size: MediaQueryHeight(context) * 0.2,
                  color: const Color(0xFF06416A),
                ),
              ),
              SizedBox(height: MediaQueryHeight(context)*0.1,),
              SizedBox(
                width: MediaQueryWidth(context) * 0.9,
                child: TextField(
                  controller: _cpfController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o CPF',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: MediaQueryHeight(context)*0.01,),
              SizedBox(height: MediaQueryHeight(context) * 0.05),
              ElevatedButton(
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
                      style: TextStyle(
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
                        )
                  ]
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DadosDestinatarioPage()));
                },
              ),
              SizedBox(height: MediaQueryHeight(context) * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
