import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/shared/global_widgets/avatar_image.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/global_widgets/profile_data_info.dart';
import 'package:rpsp_main/app/shared/global_widgets/select_date_widget.dart';
import 'package:rpsp_main/app/shared/global_widgets/textfield_custom.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';

import '../controllers/edit_profile_controller.dart';

part '../components/input_name.dart';
part '../components/input_birth_date.dart';
part '../components/input_email.dart';

part '../components/avatar_image.dart';
part '../components/select_country.dart';
part '../components/select_county.dart';
part '../components/select_language.dart';
part '../components/select_sex.dart';

// ignore: must_be_immutable
class EditProfileView extends GetView<EditProfileController> {
  late Responsive responsive;

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    responsive = Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _AvatarImage(),
                    const SizedBox(height: 15),
                    _NameInput(),
                    _BirthDateInput(),
                    _EmailInput(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: responsive.wp(50) - 5,
                          child: _CountrySelect(),
                        ),
                        SizedBox(
                          width: responsive.wp(50) - 5,
                          child: _CountySelect(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _LanguageSelect(),
                    const SizedBox(height: 10),
                    _SexSelect(),
                    const SizedBox(height: 10),
                    CustomMaterialButton(
                      paddingH: 15,
                      child: const Text(
                        'GUARDAR',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Positioned(
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}
