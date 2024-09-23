import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/onboarding/components/onboarding_info_model.dart';
import 'package:rpsp_main/app/routes/app_pages.dart';
import 'package:rpsp_main/app/shared/global_widgets/name_logo_app.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';
import 'package:rpsp_main/app/modules/onboarding/controllers/onboarding_controller.dart';

part 'package:rpsp_main/app/modules/onboarding/components/background_image.dart';
part 'package:rpsp_main/app/modules/onboarding/components/onboarding_info_widget.dart';
part 'package:rpsp_main/app/modules/onboarding/components/onboarding_items.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _.pageController,
            onPageChanged: _.selectedPageIndex.call,
            itemCount: _.onboardingPages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  BackgroundImage(index),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      const SizedBox(height: 50),
                      const NameLogoApp(),
                      const Spacer(),
                      const SizedBox(height: 100),
                      OnboardingInfoWidget(_.onboardingPages[index]),
                      const SizedBox(height: 15),
                      OnboardingItems(),
                      const SizedBox(height: 50),
                      _CustomButton(
                          child: Obx(() => Text(
                              _.isLastPage ? 'COMENZAR' : 'SIGUIENTE',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0))),
                          onPressed: () => _.isLastPage
                              ? Get.offNamed(Routes.auth)
                              : _.fowardAction()),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const _CustomButton({
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: MaterialButton(
          disabledColor: Theme.of(context).primaryColorDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          height: 60,
          minWidth: responsive.width,
          color: Theme.of(context).primaryColor,
          elevation: 6,
          padding: const EdgeInsets.all(7.0),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
