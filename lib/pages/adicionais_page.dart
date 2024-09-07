import 'package:flutter/material.dart';
import 'package:hermesapp/pages/codigo_barras_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosButton.dart';

class AdicionaisPage extends StatefulWidget {
  const AdicionaisPage({super.key});

  @override
  State<AdicionaisPage> createState() => _AdicionaisPageState();
}

class _AdicionaisPageState extends State<AdicionaisPage> {
  String? _selectedOption;

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Insira seus dados",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              RadioListTile<String>(
                title: const Text('Seguro contra: Serviços não prestados;\nAtraso na entrega;\nDevolução/entrega indevida;\nAcidentes que comprometem a integridade do objeto.'),
                value: 'Seguro',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Aviso de recebimento'),
                value: 'Recebimento',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Não desejo nada'),
                value: 'Nada',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CorreiosButton(context, "Prosseguir", _selectedOption != null
                  ? const CodigoBarrasPage()
                  : const AdicionaisPage()),
            ],
          ),
        ),
      )
    );
  }
}
