part of '../views/edit_profile_view.dart';

class _NameInput extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return ProfileDataInfo(
      icon: FontAwesomeIcons.userAlt,
      title: 'Nombre:',
      isTitleStyleEditProfile: true,
      widget: TextFieldCustom(
        backgroundColor: Colors.white,
        controller: _.nameTextController,
        hintText: 'Nombre',
        textInputType: TextInputType.name,
        capitalization: true,
      ),
    );
  }
}
