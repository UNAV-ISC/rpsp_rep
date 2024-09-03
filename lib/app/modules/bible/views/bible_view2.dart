import 'package:flutter/material.dart';

import 'package:get/get.dart';
//import 'package:rpsp_main/app/modules/home/views/home_view.dart';
import 'package:rpsp_main/app/modules/text/views/text_view.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/buttom_card.dart';
//import '../components_extra/bible_tab.dart';
import '../controllers/bible_controller.dart';
import 'app_bar_custom.dart'; // Actualiza la ruta según la ubicación real del archivo
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';

part '../components_extra/bible_tab.dart';
part '../components_extra/bible_card.dart';
part '../components_extra/chapter_card.dart';
part '../components_extra/old_testament_tab.dart';
part '../components_extra/new_testament_tab.dart';
part '../components_extra/book_modal.dart';

class BibleView2 extends GetView<BibleController> {
  const BibleView2({super.key});

  @override
  Widget build(BuildContext context) {
    //////
    final _prefs = StoragePrefs();
    ////
    return Scaffold(
      //Cambio de tema
      //backgroundColor: _prefs.isDarkMode? const Color.fromARGB(255, 41, 61, 77):const Color.fromARGB(255, 255, 255, 255),
      ///
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 12, right: 12),
              child: Column(
                children: [
                  const AppBarCustom(),
                  Expanded(child: _BibleTab()),
                ],
              ),
            ),
            //_backButton(context),
          ],
        ),
        // child: _BibleTab(),
      ),
    );
  }

  Row _appBarCustom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Biblia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
/*
  Widget _backButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => Navigator.pop(context),
      //onPressed: () {},
    );
  }*/
}
