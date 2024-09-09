import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';

class ProfileDataInfo extends StatelessWidget {
  final bool titleInLeft;
  final String title;
  final String? info;
  final IconData? icon;
  final Widget? widget;
  final bool isTitleStyleEditProfile;

  const ProfileDataInfo({
    super.key,
    required this.title,
    this.info,
    this.icon,
    this.widget,
    this.titleInLeft = false,
    this.isTitleStyleEditProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    const iconColor = Color.fromARGB(255, 68, 68, 70);
    final _prefs = StoragePrefs();
    var thme = _prefs.isDarkMode;
    //print(thme);
    const titleStyleOrig = TextStyle(fontSize: 13, fontWeight: FontWeight.w600);

    var infoStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      //color: thme ? Colors.grey : Colors.black
    );
    /*const infoStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey);*/

    var titleStyleEditProfile = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      //color: thme ? Colors.white : Colors.black
    );

    TextStyle titleStyle;

    if (info == null && !isTitleStyleEditProfile) {
      titleStyle = infoStyle;
    } else if (info == null && isTitleStyleEditProfile) {
      titleStyle = titleStyleEditProfile;
    } else {
      titleStyle = titleStyleOrig;
    }

    Widget? kLeading;
    if (icon == null && !titleInLeft) {
      kLeading = const SizedBox(width: 10, height: 10);
    } else if (icon == null && titleInLeft) {
      kLeading = null;
    } else {
      kLeading = Icon(icon, color: iconColor, size: 20);
    }

    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 30,
          horizontalTitleGap: 0,
          leading: kLeading,
          title: Text(title, style: titleStyle
              // this.info == null ? infoStyle : titleStyle
              ),
          subtitle: info == null ? null : Text(info!, style: infoStyle),
        ),
        if (widget != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: widget,
          ),
      ],
    );
  }
}
