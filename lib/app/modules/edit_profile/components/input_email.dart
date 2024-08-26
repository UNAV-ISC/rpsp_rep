part of '../views/edit_profile_view.dart';

class _EmailInput extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return ProfileDataInfo(
      icon: FontAwesomeIcons.at,
      title: 'Correo Electrónico:',
      isTitleStyleEditProfile: true,
      widget: TextFieldCustom(
        backgroundColor: Colors.white,
        controller: _.nameTextController,
        hintText: 'Correo Electrónico',
        textInputType: TextInputType.name,
        capitalization: true,
      ),
    );
  }
}
