import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/onboarding/components/onboarding_info_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  fowardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  List<OnBoardingInfoModel> onboardingPages = [
    OnBoardingInfoModel(
      title: 'Adoración diaria',
      description: 'Lecturas diarias con devocionales y reflexiones',
    ),
    OnBoardingInfoModel(
      title: 'Oraciones',
      description:
          'Crea tu propia lista de oración y compártela con tus amigos',
    ),
    OnBoardingInfoModel(
      title: 'Escucha',
      description: 'Puedes oir y repetir las veces que quieras las reflexiones',
    ),
    OnBoardingInfoModel(
      title: 'Seguimiento de progreso',
      description:
          'Fíjate una meta y realice un seguimiento de su progreso con tus amigos.',
    )
  ];
}
