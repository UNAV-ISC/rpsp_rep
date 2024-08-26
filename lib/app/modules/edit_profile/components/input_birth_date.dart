part of '../views/edit_profile_view.dart';

class _BirthDateInput extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return ProfileDataInfo(
      icon: FontAwesomeIcons.calendarAlt,
      title: 'Fecha de Nacimiento:',
      isTitleStyleEditProfile: true,
      widget: Obx(
        () => SelectDateWidget(
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
            focusColor: Colors.green,
            hintText: 'Fecha de nacimiento',
            hintStyle: const TextStyle(fontWeight: FontWeight.w300),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          dateString: _.birthDate.value,
          hint: 'Fecha de nacimiento',
          onChanged: (dateString, date) => _.birthDate.value = dateString,
          // validator: (value) {
          //   if (value == null || value.isEmpty || value.length < 1)
          //     return 'Fecha de nacimiento es requerida';
          //   return null;
          // },
        ),
      ),
    );
  }
}
