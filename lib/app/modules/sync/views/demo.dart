import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/video_player/views/video_youtube.dart';
import 'package:rpsp_main/app/routes/app_pages.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';
import 'package:url_launcher/url_launcher.dart';
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

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir el enlace: $url';
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
      onPressed: () => Get.toNamed(Routes.youtubePlayer),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              height: 140,
              width: 140,
              image: AssetImage('assets/recursos/himnario-logo.png')),
          title: 'Himnario',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://play.google.com/store/apps/details?id=mx.daro.himnario');
          },
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              height: 140,
              width: 140,
              image: AssetImage('assets/recursos/bible.png')),
          title: 'Biblia',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://play.google.com/store/apps/details?id=org.reyfasoft.reinavalera1960');
          },
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              width: 140, image: AssetImage('assets/recursos/reavivados.png')),
          title: 'Canal YouTube',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://www.youtube.com/@reavivadosporsupalabraoficial');
          },
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              height: 130,
              width: 140,
              image: AssetImage('assets/recursos/EGW-logo.png')),
          title: 'Escritos EGW',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://play.google.com/store/apps/details?id=com.whiteestate.egwwritings');
          },
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DemoCard(
          image: const Image(
              width: 140, image: AssetImage('assets/recursos/esc_sab.png')),
          title: 'Escuela Sabática',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://play.google.com/store/apps/details?id=com.cryart.sabbathschool');
          },
        ),
        const SizedBox(width: 15),
        _DemoCard(
          image: const Image(
              width: 140,
              height: 140,
              image: AssetImage('assets/recursos/matinal.png')),
          title: 'Devoción Matutina',
          rightText: '',
          onPressed: () {
            _launchURL(
                'https://play.google.com/store/apps/details?id=com.advenz.devocionalesmatutinos');
          },
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
