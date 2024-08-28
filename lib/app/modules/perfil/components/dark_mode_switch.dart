part of '../views/perfil_view.dart';

class _DarkModeSwitch extends GetView<ProfileController> {
  final _prefs = StoragePrefs();
  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Obx(
      () => FlutterSwitch(
          valueFontSize: 15,
          padding: 0,
          height: 30.0,
          width: 75.0,
          activeTextColor: Colors.white,
          inactiveTextColor: Colors.white,
          showOnOff: true,
          toggleSize: 28.0,
          borderRadius: 30.0,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: const Color(0xffC8881F),
          value: _.darkMode.value,
          onToggle: (value) {
            _.darkMode.value = value;
            Get.changeTheme(Get.isDarkMode ? themeLight() : ThemeData.dark());
            print(Get.isDarkMode);
            _prefs.darkTheme = !Get.isDarkMode;
            _prefs.isDarkMode = !Get.isDarkMode;
            
          }),
    );
  }
}
