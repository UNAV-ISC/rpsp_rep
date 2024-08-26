import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../home/views/home_view.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:rpsp_main/app/shared/global_widgets/starts_level.dart';
import 'package:rpsp_main/app/shared/helpers/navigate_to.dart';
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';
import 'package:rpsp_main/app/shared/theme/theme.dart';
import '../controllers/perfil_controller.dart';

import 'package:rpsp_main/app/shared/global_widgets/avatar_image.dart';
import 'package:rpsp_main/app/shared/global_widgets/profile_data_info.dart';
import 'package:rpsp_main/app/shared/responisve/responsive.dart';

part '../components/dark_mode_switch.dart';
part '../components/ver_button.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  late Responsive responsive;

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    
    responsive = Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarImage(
                  bigRadius: 86,
                  externalColor: Colors.white,
                  file: _.file,
                  captureImage: _.captureImage,
                  selectImage: _.selectImageFromGallery,
                ),
                const SizedBox(height: 15),
                _verticalData(context),
                _rowData()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _verticalData(context) {
    final _ = controller;
   
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_.user.name} ${_.user.lastName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xffF5C00B)),
                // onPressed: () => Get.to(EditProfileView())
                onPressed: () => navigateTo(context, EditProfileView()),
              )
            ],
          ),
          subtitle: Text(
            _.user.email,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        ),
        ProfileDataInfo(
          icon: FontAwesomeIcons.user,
          title: 'Nombre',
          info: _.user.name,
          
        ),
        ProfileDataInfo(
          icon: FontAwesomeIcons.solidCalendarDays,
          title: 'Fecha de nacimiento',
          info: _.user.birthDate!,
        ),
        ProfileDataInfo(
          icon: FontAwesomeIcons.at,
          title: 'Correo Electrónico',
          info: _.user.birthDate!,
        ),
      ],
    );
  }

  Widget _rowData() {
    return SizedBox(
      width: responsive.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_leftData(), _rightData()],
      ),
    );
  }

  Widget _leftData() {
    final _ = controller;
    return SizedBox(
      width: responsive.wp(60) - 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileDataInfo(
            icon: FontAwesomeIcons.globe,
            title: 'País',
            info: _.user.country!,
          ),
          ProfileDataInfo(
            icon: FontAwesomeIcons.language,
            title: 'Idioma',
            info: _.user.language!,
          ),
          const ProfileDataInfo(
              icon: FontAwesomeIcons.solidMoon, title: 'Modo oscuro'),
          const ProfileDataInfo(
            icon: FontAwesomeIcons.solidStar,
            title: 'Nivel de usuario',
          ),
          const ProfileDataInfo(
            icon: FontAwesomeIcons.medal,
            title: 'Medallero',
          ),
        ],
      ),
    );
  }

  Widget _rightData() {
    final _ = controller;
    return SizedBox(
      // color: Colors.brown,
      width: responsive.wp(40) - 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileDataInfo(title: 'Estado', info: _.user.county!),
          ProfileDataInfo(title: 'Sexo', info: _.user.sex!),
          const SizedBox(height: 10),
          _DarkModeSwitch(),
          const SizedBox(height: 15),
          const StarsLevel(),
          const SizedBox(height: 15),
          _VerButton()
        ],
      ),
    );
  }
}
