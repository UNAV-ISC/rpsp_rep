import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:rpsp_main/app/routes/app_pages.dart';
import 'package:rpsp_main/app/shared/global_widgets/avatar_image.dart';
import 'package:rpsp_main/app/shared/global_widgets/buttons/custom_material_button.dart';
import 'package:rpsp_main/app/shared/global_widgets/name_logo_app.dart';
import 'package:rpsp_main/app/shared/global_widgets/textfield_custom.dart';

import '../controllers/auth_controller.dart';
part '../components/email_view.dart';
part '../components/name_view.dart';
part '../components/register_view.dart';
part '../components/perfil_photo_view.dart';
// part '../components/select_image.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => PageView(
        controller: _.pageController,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          _RegisterView(),
          _EmailView(),
          _NameView(),
          _PerfilPhotoView(),
        ],
      ),
    );
  }
}
