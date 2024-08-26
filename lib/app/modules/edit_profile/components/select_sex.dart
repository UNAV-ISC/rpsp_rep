part of '../views/edit_profile_view.dart';

class _SexSelect extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;

    final responsive = Responsive(context);

    final kTextStyle = const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey);

    return ProfileDataInfo(
      title: 'Sexo',
      isTitleStyleEditProfile: true,
      titleInLeft: true,
      widget: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: responsive.wp(40),
                child: Row(
                  children: [
                    Text('Femenino', style: kTextStyle),
                    Radio<String>(
                      activeColor: const Color(0xffF5C00B),
                      value: 'Femenino',
                      groupValue: _.sex.value,
                      onChanged: (value) => _.sex.value = value!,
                    ),
                  ],
                )),
            SizedBox(
                width: responsive.wp(40),
                child: Row(
                  children: [
                    Text('Masculino', style: kTextStyle),
                    Radio<String>(
                      activeColor: const Color(0xffF5C00B),
                      value: 'Masculino',
                      groupValue: _.sex.value,
                      onChanged: (value) => _.sex.value = value!,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
