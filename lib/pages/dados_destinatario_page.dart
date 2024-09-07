// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hermesapp/pages/adicionais_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosIconeBordaButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DadosDestinatarioPage extends StatefulWidget {
  const DadosDestinatarioPage({super.key});

  @override
  _DadosDestinatarioPageState createState() => _DadosDestinatarioPageState();
}

class _DadosDestinatarioPageState extends State<DadosDestinatarioPage> {
  final _cepController = TextEditingController();
  final _nomeController = TextEditingController();
  final _numeroController = TextEditingController();
  final _complementoController = TextEditingController();
  String _address = '';
  bool _isLoading = false;

  Future<void> _fetchAddress() async {
    final cep = _cepController.text;
    if (cep.isEmpty) {
      setState(() {
        _address = 'Por favor, insira um CEP.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _address = '';
    });

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/address/$cep'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _address = 'Rua: ${data['street']}\nBairro: ${data['neighborhood']}\nCidade: ${data['city']}\nEstado: ${data['state']}\nCEP: ${data['postal_code']}';
      });
      _showAddressDialog(); // Mostra o pop-up com as informações
    } else {
      setState(() {
        _address = 'CEP não encontrado.';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showAddressDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Endereço encontrado'),
          content: Text(_address),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o pop-up
                _fetchAddress(); // Atualizar as informações ao apertar "Atualizar"
              },
              child: const Text('Atualizar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o pop-up ao apertar "Tudo certo"
              },
              child: const Text('Tudo certo'),
            ),
          ],
        );
      },
    );
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
          height: MediaQueryHeight(context),
          width: MediaQueryWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQueryHeight(context)*0.1,),
              Text(
                "Insira os dados\ndo destinatário",
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
                  Icons.download_outlined,
                  size: MediaQueryHeight(context) * 0.2,
                  color: const Color(0xFF06416A),
                ),
              ), 
              SizedBox(
                width: MediaQueryWidth(context) * 0.9,
                child: TextField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o nome completo',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: MediaQueryWidth(context) * 0.9,
                child: TextField(
                  controller: _cepController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Digite o CEP',
                    suffix: InkWell(
                      onTap: _fetchAddress,
                      child: const Icon(
                        Icons.search,
                        color: Color(0xFF06416A),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQueryWidth(context) * 0.45,
                    child: TextField(
                      controller: _numeroController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite o número',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: MediaQueryWidth(context) * 0.01,),
                  SizedBox(
                    width: MediaQueryWidth(context) * 0.45,
                    child: TextField(
                      controller: _complementoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite o complemento',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              CorreiosIconeBordaButton(context, "Prosseguir", const AdicionaisPage()),
              _isLoading
                  ? Container()
                  : Container(), // Placeholder para o loading
            ],
          ),
        ),
      ),
    );
  }
}
