import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/global_widgets/page_with_sliver.dart';

import '../controllers/personal_plan_controller.dart';

part '../components/plan_widget.dart';

class PersonalPlanView extends GetView<PersonalPlanController> {
  const PersonalPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return const PageWithSliver(
        title: 'Plan Personal',
        imagePath: 'personal_plan.jpg',
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Planes de Lectura',
              style: TextStyle(
                  height: 1.6,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          _PlanWidget(index: 0, text: 'Cristo el Camino'),
          _PlanWidget(index: 1, text: 'El credo del joven triunfador'),
        ]);
  }
}
