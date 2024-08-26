import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rpsp_main/app/modules/prayers_list/controllers/prayers_list_controller.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/helpers/date_2_spanish_date.dart';

part '../components/add_title.dart';
part '../components/add_text_box.dart';
part '../components/select_prayers.dart';
part '../components/today_widget.dart';

class AddPrayersListView extends GetView<PrayersListController> {
  const AddPrayersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Title(),
                    const SizedBox(height: 20),
                    _AddTextBox(),
                    _SelectPrayers(),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
