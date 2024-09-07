// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hermesapp/pages/concluido.dart';
import 'package:hermesapp/pages/dados_remetente_page.dart';
import 'package:hermesapp/service/media_query.dart';
import 'package:hermesapp/widgets/CorreiosButton.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({super.key});

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {
  File? _image;
  ui.Image? _imageWithBoxes;
  final picker = ImagePicker();
  List<dynamic> _detections = [];
  double _imageWidth = 0.0;
  double _imageHeight = 0.0;

  // Função para capturar a imagem da câmera
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        detectObjects(_image!);
      } else {
        debugPrint('Nenhuma imagem selecionada.');
      }
    });
  }

  // Função para enviar a imagem para a API FastAPI e obter as detecções
  Future<void> detectObjects(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/detect/'), // Use o IP correto para seu servidor
    );
    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var decodedData = json.decode(responseData);

      setState(() {
        _detections = decodedData['detections'];
      });

      // Processar e desenhar as bounding boxes na imagem
      drawBoundingBoxes();
    } else {
      debugPrint('Erro ao detectar objetos: ${response.statusCode}');
    }
  }

  // Função para desenhar bounding boxes na imagem
  Future<void> drawBoundingBoxes() async {
    if (_image == null || _detections.isEmpty) return;

    final imageBytes = await _image!.readAsBytes();
    final decodedImage = await decodeImageFromList(imageBytes);

    _imageWidth = decodedImage.width.toDouble();
    _imageHeight = decodedImage.height.toDouble();

    // Criar um Canvas para desenhar as bounding boxes
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
        recorder,
        Rect.fromPoints(
            const Offset(0, 0),
            Offset(_imageWidth, _imageHeight)));
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawImage(decodedImage, Offset.zero, Paint());

    // Desenhar as bounding boxes
    for (var detection in _detections) {
      var bbox = detection['box'];
      double x = bbox['x'].toDouble();
      double y = bbox['y'].toDouble();
      double width = bbox['w'].toDouble();
      double height = bbox['h'].toDouble();

      // Ajustar as coordenadas da bounding box para o tamanho da imagem exibida
      double scaleX = _imageWidth / MediaQueryWidth(context);
      double scaleY = _imageHeight / MediaQueryHeight(context);

      x *= (scaleX/1.75);
      y *= scaleY;
      width *= scaleX;
      height *= (scaleY/0.9);

      Rect rect = Rect.fromLTWH(x, y, width, height);
      canvas.drawRect(rect, paint);
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(_imageWidth.toInt(), _imageHeight.toInt());

    setState(() {
      _imageWithBoxes = img;
    });
  }
  
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
              SizedBox(height: MediaQueryHeight(context)*0.1,),
              Text(
                "Insira seu pacote",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.035,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQueryHeight(context)*0.02,),
              Text(
                "Posicione sua\nencomenda no centro\npara verificação",
                style: TextStyle(
                  fontSize: MediaQueryHeight(context) * 0.03,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQueryHeight(context) * 0.025),
              SizedBox(
                width: MediaQueryWidth(context) * 0.8,
                height: MediaQueryHeight(context) * 0.4,
                child: _image == null
                ? SizedBox(
                    width: MediaQueryWidth(context) * 0.8,
                    height: MediaQueryHeight(context) * 0.4,
                    child: const Center(child: Text('APÓS INSERIR A ENCOMENDA,\nCAPTURE-A', textAlign: TextAlign.center,)),
                  )
                : _imageWithBoxes != null
                    ? FittedBox(
                        child: SizedBox(
                          width: _imageWithBoxes!.width.toDouble(),
                          height: _imageWithBoxes!.height.toDouble(),
                          child: CustomPaint(
                            painter: BoundingBoxPainter(_imageWithBoxes!),
                          ),
                        ),
                      )
                    : Image.file(_image!),
              ),
              SizedBox(height: MediaQueryHeight(context)*0.025),
              _image == null
                ? ElevatedButton(
                onPressed: getImage,
                child: const Icon(Icons.camera_alt),
              ) : 
              CorreiosButton(context, "Prosseguir", const ConcluidoPage()),
            ],
          ),
          ),
        ),
      );
  }
}

class BoundingBoxPainter extends CustomPainter {
  final ui.Image image;
  BoundingBoxPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}