import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/personal_plan/views/personal_plan_view.dart';
import 'package:rpsp_main/app/modules/plans/views/calendar_plan.dart';
//import 'package:rpsp_main/app/modules/plans/views/read_plan.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/global_widgets/user_data_logo.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';

import '../controllers/plans_controller.dart';

class PlansView extends GetView<PlansController> {
  final kTextStyle =
      const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700);

  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataLogo(),
                const SizedBox(height: 15),
                Text('Plan para damas', style: kTextStyle),
                const _CustomImage(index: 0, text: 'Cristo el camino'),
                const SizedBox(height: 20),
                Text('Plan de lectura', style: kTextStyle),
                const _CustomImage(
                    index: 1, text: 'El credo del joven triunfador'),
                const SizedBox(height: 40),
                CustomMaterialButton(
                  paddingH: 15,
                  child: const Text(
                    'AGREGAR PLAN',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () =>
                      navigateTo(context, const PersonalPlanView()),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomImage extends StatelessWidget {
  final int index;
  final String text;
  const _CustomImage({required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: ExactAssetImage('assets/plans/$index.jpg'),
            colorFilter:
                const ColorFilter.mode(Colors.black26, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: SizedBox(
              // color: Colors.red,
              width: 160,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      onPressed: () =>
          navigateTo(context, CalendarPlanView(index: index, text: text)),
    );
  }
}
