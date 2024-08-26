import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/prayers_list/views/add_prayers_list_view.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/global_widgets/page_with_sliver.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';
import '../controllers/prayers_list_controller.dart';

class PrayersListView extends GetView<PrayersListController> {
  const PrayersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return PageWithSliver(
      title: 'Lista de Peticiones',
      imagePath: 'prayer.jpg',
      children: [
        const Text(
          '''Lorem ipsum dolor sit amet consectetur adipiscing elit euismod tristique, eros suspendisse dignissim conubia velit nostra lacus luctus lobortis curabitur, habitasse libero integer class porttitor ac ante proin. Accumsan taciti urna netus potenti orci platea convallis molestie litora, rhoncus sem dapibus diam lacus proin a dis, mollis venenatis dui sollicitudin eget nulla interdum vehicula. Parturient ut purus vel sagittis, lacus nisl litora, varius augue ultrices.
          ''',
          style: TextStyle(
              height: 1.6, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        CustomMaterialButton(
          paddingH: 0,
          child: const Text(
            'Agregar lista de peticiones',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () => navigateTo(context, const AddPrayersListView()),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 150,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 150,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 150,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 150,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 150,
          color: Colors.white,
        ),
      ],
    );
  }
}
