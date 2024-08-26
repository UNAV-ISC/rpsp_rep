part of '../views/edit_profile_view.dart';

class _CountySelect extends GetView<EditProfileController> {
  final List genderList = [
    "Otro1",
    "Otro2",
  ];

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return ProfileDataInfo(
      title: 'Estado',
      isTitleStyleEditProfile: true,
      titleInLeft: true,
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
            hintText: 'Seleccione su Estado',
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
          value: _.county.value.isEmpty ? null : _.county.value,
          items: genderList.map((items) {
            return DropdownMenuItem<String>(value: items, child: Text(items));
          }).toList(),
          onChanged: (String? value) => _.county.value = value!,
          // validator: (value) => value == null ? 'Sexo es requerido' : null,
        ),
      ),
    );
  }
}
