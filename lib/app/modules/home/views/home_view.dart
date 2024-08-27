import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/bible/views/bible_view.dart';
import 'package:rpsp_main/app/modules/cita_diaria/views/cita_diaria_view.dart';
import 'package:rpsp_main/app/modules/egw/views/egw_view.dart';
import 'package:rpsp_main/app/modules/prayers_list/views/prayers_list_view.dart';
import 'package:rpsp_main/app/routes/app_pages.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/global_widgets/user_data_logo.dart';
import 'package:rpsp_main/app/shared/helpers/date_2_spanish_date.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/home_controller.dart';

part '../components/home_card.dart';
part '../components/prayer_dialog.dart';
part '../components/bible_dialog.dart';
part '../components/calendar.dart';

class HomeView extends GetView<HomeController> {
  final iconCOlor = const Color(0xff4B4B49);

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    // final _prefs = StoragePrefs();
    return Scaffold(
      //backgroundColor: _prefs.isDarkMode? const Color.fromARGB(255, 41, 61, 77):const Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserDataLogo(),
                const SizedBox(height: 15),
                ..._buildCards(context),
                const SizedBox(height: 15),
                _Calendar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCards(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    // final _prefs = StoragePrefs();
    return [
      _HomeCard(
        icon: Stack(
          children: [
            Icon(
              FontAwesomeIcons.solidCalendarCheck,
              color: iconCOlor,
            ),
          ],
        ),
        title: 'Cita Diaria',
        rightText: 'Mateo 4:15',
        onPressed: () => navigateTo(
          context,
          const CitaDiariaView(
            abbv: 'gen',
            nChapter: 4,
            verses: 1,
          ),
        ),
      ),
      _HomeCard(
          icon: Stack(
            children: [
              Icon(
                FontAwesomeIcons.solidCirclePlay,
                color: iconCOlor,
              ),
            ],
          ),
          title: 'Video',
          rightText: 'RPSP',
          onPressed: () => Get.toNamed(Routes.youtubePlayer)),
      //onPressed: () => Get.toNamed(Routes.VIDEO_PLAYER)),
      _HomeCard(
        icon: Stack(
          children: [
            Icon(FontAwesomeIcons.bookBible, color: iconCOlor),
          ],
        ),
        title: 'Biblia',
        rightText: '1 de reyes',
        //onPressed: () => Get.toNamed(Routes.BIBLE),
        onPressed: () => _bibleDialog(context),
      ),
      _HomeCard(
          icon: Stack(
            children: [
              Icon(FontAwesomeIcons.book, color: iconCOlor),
            ],
          ),
          title: 'EGW',
          rightText: 'Capítulo 4',
          onPressed: () => (
              // navigateTo(
              //   context,
              //   const TextView(title: 'Titulo', subTitle: 'Subtitulo'),
              // ),
              navigateTo(context, EGWView()))),
      _HomeCard(
        icon: Icon(FontAwesomeIcons.music, color: iconCOlor),
        title: 'Himno',
        rightText: '#125',
        onPressed: () => Get.toNamed(Routes.hymnPlayer),
      ),
      _HomeCard(
        icon: Icon(FontAwesomeIcons.handsPraying, color: iconCOlor),
        title: 'Oración',
        onPressed: () => _prayerDialog(context),
      ),
    ];
  }
}
