import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
part '../components/recursos_card.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recursos'),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ..._buildCards(context),
              ],
            ),
          ),
        )));
  }
}

_buildCards(BuildContext context) {
  return [
    _DemoCard(
      image: const Image(
          height: 140,
          image: AssetImage('assets/recursos/logo_radio-esperanza.png')),
      title: 'Radio',
      rightText: '',
      onPressed: () {},
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              height: 140,
              image: AssetImage('assets/recursos/himnario-logo.png')),
          title: 'Himnario Oficial',
          rightText: '',
          onPressed: () {},
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              height: 140, image: AssetImage('assets/recursos/bible.png')),
          title: 'Biblia Oficial',
          rightText: '',
          onPressed: () {},
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              width: 140, image: AssetImage('assets/recursos/reavivados.png')),
          title: 'YouTube Oficial',
          rightText: '',
          onPressed: () {},
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              width: 140,
              height: 140,
              image: AssetImage('assets/recursos/EGW-logo.png')),
          title: 'Escritos EGW',
          rightText: '',
          onPressed: () {},
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              width: 140, image: AssetImage('assets/recursos/reavivados.png')),
          title: 'YouTube Oficial',
          rightText: '',
          onPressed: () {},
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              width: 140,
              height: 140,
              image: AssetImage('assets/recursos/EGW-logo.png')),
          title: 'Escritos EGW',
          rightText: '',
          onPressed: () {},
        ),
      ],
    ),
    // _HomeCard(
    //     icon: const Stack(
    //       children: [
    //         Icon(
    //           FontAwesomeIcons.solidCirclePlay,
    //         ),
    //       ],
    //     ),
    //     title: 'Video',
    //     rightText: 'RPSP',
    //     onPressed: () => Get.toNamed(Routes.youtubePlayer)),
    // _HomeCard(
    //     icon: const Stack(children: [Icon(FontAwesomeIcons.bookBible)]),
    //     title: 'Biblia',
    //     rightText: '1 de reyes',
    //     //onPressed: () => Get.toNamed(Routes.BIBLE),
    //     onPressed: () => _bibleDialog(context)),
    // _HomeCard(
    //     icon: const Stack(children: [Icon(FontAwesomeIcons.book)]),
    //     title: 'EGW',
    //     rightText: 'Capítulo 4',
    //     onPressed: () => (
    //         // navigateTo(
    //         //   context,
    //         //   const TextView(title: 'Titulo', subTitle: 'Subtitulo'),
    //         // ),
    //         navigateTo(context, EGWView()))),
    // _HomeCard(
    //     icon: const Icon(FontAwesomeIcons.music),
    //     title: 'Himno',
    //     rightText: '#125',
    //     onPressed: () => Get.toNamed(Routes.hymnPlayer)),
    // _HomeCard(
    //     icon: const Icon(FontAwesomeIcons.handsPraying),
    //     title: 'Oración',
    //     onPressed: () => _prayerDialog(context)),
    // _HomeCard(
    //   icon: Icon(FontAwesomeIcons.wifi),
    //   title: 'Recursos',
    //   //onPressed: ()=> Get.toNamed(Routes.syncp),
    //   onPressed: () => navigateTo(context, const Demo()),
    // )
  ];
}
