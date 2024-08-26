part of '../views/edit_profile_view.dart';

class _LanguageSelect extends GetView<EditProfileController> {
  final List genderList = [
    "Español",
    "Inglés",
    "Protugués",
    "Francés",
  ];

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return ProfileDataInfo(
      icon: FontAwesomeIcons.language,
      title: 'Idioma',
      isTitleStyleEditProfile: true,
      widget: Obx(
        () => DropdownButtonFormField(
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color(0xffF5C00B),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
            focusColor: Colors.green,
            hintText: 'Seleccione su idioma',
            hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            contentPadding: const EdgeInsets.only(left: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          iconSize: 40,
          value: _.language.value.isEmpty ? null : _.language.value,
          items: genderList.map((items) {
            return DropdownMenuItem<String>(value: items, child: Text(items));
          }).toList(),
          onChanged: (String? value) => _.language.value = value!,
          // validator: (value) => value == null ? 'Sexo es requerido' : null,
        ),
      ),
    );
  }
}
