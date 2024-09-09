import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/text/views/text_view.dart';
import 'package:rpsp_main/app/shared/conectivityCheck/checker.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/buttom_card.dart';
//<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
//import '../components_extra/bible_tab.dart';
//=======
//>>>>>>> aa6a09b84f5a8ae81d4cf6fa76768b86e7511e5a
import '../controllers/bible_controller.dart';
import 'app_bar_custom.dart'; // Actualiza la ruta según la ubicación real del archivo
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';
import 'package:rpsp_main/app/shared/conectivityCheck/connService.dart';

part '../components_extra/bible_tab.dart';
part '../components_extra/bible_card.dart';
part '../components_extra/chapter_card.dart';
part '../components_extra/old_testament_tab.dart';
part '../components_extra/new_testament_tab.dart';
part '../components_extra/book_modal.dart';

class BibleView2 extends GetView<BibleController> {
  const BibleView2({super.key});
  //final _prefs = StoragePrefs();
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 12, right: 12),
              child: Column(
                children: [
                  const AppBarCustom(),
                  Expanded(child: _BibleTab()),
                  //Expanded(child: _prefs.isConected? _BibleTab(): Checker()),
                 

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
