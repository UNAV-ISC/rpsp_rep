import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//<<<<<<< HEAD
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/theme/theme_dark.dart';
import '../../home/views/home_view.dart';
//import 'package:rpsp_main/app/shared/responisve/responsive.dart';
//=======
import 'package:get/get_core/get_core.dart';
import 'package:rpsp_main/app/shared/theme/theme_dark.dart';
//>>>>>>> aa6a09b84f5a8ae81d4cf6fa76768b86e7511e5a

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
part '../components/theme_dialog.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AvatarImage(
                  bigRadius: 50,
                  file: _.file,
                  captureImage: _.captureImage,
                  selectImage: _.selectImageFromGallery),
              _dataProfile(context),
              _links(),
              _dataPersonal(context),
              _rowData()
            ],
          ),
        ),
      ),
    );
  }

  Widget _links() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Get.theme.splashColor, shape: BoxShape.circle),
                child: const Icon(FontAwesomeIcons.medal, size: 24)),
            const SizedBox(height: 12),
            const Text('Medallero', style: TextStyle(fontSize: 16))
          ]),
          Column(children: [
            Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Get.theme.splashColor, shape: BoxShape.circle),
                child: const Icon(FontAwesomeIcons.medal, size: 24)),
            const SizedBox(height: 12),
            const Text('Medallero', style: TextStyle(fontSize: 16))
          ]),
          Column(children: [
            Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Get.theme.splashColor, shape: BoxShape.circle),
                child: const Icon(FontAwesomeIcons.question, size: 24)),
            const SizedBox(height: 12),
            const Text('Ayuda', style: TextStyle(fontSize: 16))
          ]),
        ],
      ),
    );
  }

  Widget _dataPersonal(context) {
    final _ = controller;

    return Container(
      width: responsive.width,
      height: 400,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Mis Datos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            ProfileDataInfo(
              icon: FontAwesomeIcons.solidCalendarDays,
              title: 'Cumpleaños',
              info: _.user.birthDate!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataProfile(context) {
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
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // IconButton(
              //   icon: const Icon(Icons.edit),
              //   onPressed: () => navigateTo(context, EditProfileView()),
              // )
            ],
          ),
          subtitle: Text(
            _.user.email,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        // ProfileDataInfo(
        //   icon: FontAwesomeIcons.user,
        //   title: 'Nombre',
        //   info: _.user.name,
        // ),
        // ProfileDataInfo(
        //   icon: FontAwesomeIcons.solidCalendarDays,
        //   title: 'Fecha de nacimiento',
        //   info: _.user.birthDate!,
        // ),
        // ProfileDataInfo(
        //   icon: FontAwesomeIcons.at,
        //   title: 'Correo Electrónico',
        //   info: _.user.birthDate!,
        // ),
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
