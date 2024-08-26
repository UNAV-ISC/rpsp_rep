import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:rpsp_main/app/data/http/Api_Dashboard.dart';
// import '../controllers/cita_diaria_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CitaDiariaView extends StatefulWidget {
  final String abbv;
  final int nChapter;
  final int verses;
  const CitaDiariaView({
    super.key,
    required this.abbv,
    required this.nChapter,
    required this.verses,
  });

  @override
  _CitaDiariaViewState createState() => _CitaDiariaViewState();
}

class _CitaDiariaViewState extends State<CitaDiariaView> {
  String bookText = '';
  String verseText = ''; // Variable para almacenar el texto del versículo

  List<String> images = [
    'assets/cita_diaria.jpg',
    'assets/cita_diaria_1.jpg',
    'assets/cita_diaria_2.jpg',
    'assets/cita_diaria_3.jpg',
    'assets/cita_diaria_4.jpg',
    'assets/cita_diaria_5.jpg',
    'assets/cita_diaria_6.jpg',
    'assets/cita_diaria_7.jpg',
  ];

  String getRandomImage() {
    Random random = Random();
    int index = random.nextInt(images.length);
    return images[index];
  }

  @override
  void initState() {
    super.initState();
    _fetchVerseFromApi(); // Llamada a la API al iniciar
  }

  Future<void> _fetchVerseFromApi() async {
    try {
      final apiUrl =
          'https://www.abibliadigital.com.br/api/verses/rvr/${widget.abbv}/${widget.nChapter}/${widget.verses}';
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final verse = json.decode(response.body);
        setState(() {
          verseText =
              verse['text']; // Actualiza el estado con el texto del versículo
        });
      } else {
        throw Exception('Failed to load verse');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BackgroundImage(imageUrl: getRandomImage()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                children: [
                  _appBarCustom(context),
                  const SizedBox(height: 10),
                  _text() // Llama al método _text() actualizado
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _appBarCustom(BuildContext context) {
    const kColor = Colors.white;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.text_fields_outlined, size: 30, color: kColor),
        Text(
          'Cita ${widget.abbv} ${widget.nChapter} : ${widget.verses}',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w600),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 30, color: kColor),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _text() {
    return Expanded(
      child: Center(
        child: Text(
          verseText.isNotEmpty
              ? verseText
              : 'Loading...', // Muestra 'Cargando...' mientras se obtiene el versículo
          textAlign: TextAlign.center,
          style: const TextStyle(
            wordSpacing: 1.5,
            height: 2,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String imageUrl;
  const _BackgroundImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(),
      ),
    );
  }
}




























// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/cita_diaria_controller.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CitaDiariaView extends GetView<CitaDiariaController> {
//   const CitaDiariaView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _BackgroundImage(),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
//               child: Column(
//                 children: [
//                   _appBarCustom(context),
//                   const SizedBox(height: 10),
//                   _text()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Row _appBarCustom(BuildContext context) {
//     const kColor = Colors.white;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Icon(Icons.text_fields_outlined, size: 30, color: kColor),
//         Text(
//           'Jeremias 1: 4-10',
//           style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
//         ),
//         IconButton(
//           icon: const Icon(Icons.close, size: 30, color: kColor),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ],
//     );
//   }

//   Widget _text() {
//     return const Expanded(
//         child: Center(
//       child: Text(
//         '''
//         Lorem ipsum dolor sit amet consectetur adipiscing elit euismod tristique, eros suspendisse dignissim conubia velit nostra lacus luctus lobortis curabitur, habitasse libero integer class porttitor ac ante proin. Accumsan taciti urna netus potenti.
//          ''',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             wordSpacing: 1.5,
//             height: 2,
//             color: Colors.white,
//             fontWeight: FontWeight.w400),
//       ),
//     ));
//   }
// }

// class _BackgroundImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//         image: ExactAssetImage('assets/cita_diaria.jpg'),
//         colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
//         fit: BoxFit.cover,
//       )),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//         child: Container(),
//       ),
//     );
//   }
// }






// @override
//   List<String> images = [
//     'assets/cita_diaria.jpg',
//     'assets/cita_diaria_1.jpg',
//     'assets/cita_diaria_2.jpg',
//     'assets/cita_diaria_3.jpg',
//     'assets/cita_diaria_4.jpg',
//     'assets/cita_diaria_5.jpg',
//     'assets/cita_diaria_6.jpg',
//     'assets/cita_diaria_7.jpg',
//   ];

//   String getRandomImage() {
//     Random random = Random();
//     int index = random.nextInt(images.length);
//     return images[index];
//   }
