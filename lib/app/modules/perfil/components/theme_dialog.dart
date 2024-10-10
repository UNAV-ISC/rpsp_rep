part of '../views/perfil_view.dart';

_themeDialog(BuildContext context) {
  final responsive = Responsive(context);

  Get.dialog(AlertDialog(
    backgroundColor: Theme.of(context).primaryColor,
    scrollable: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(FontAwesomeIcons.userGear),
        const SizedBox(width: 15),
        Text(
          'Cambio de tema',
          style: TextStyle(color: Theme.of(context).cardColor),
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    ),
    content: SizedBox(
      width: responsive.wp(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Reinicia la aplicacion para confirmar el cambio de tema',
            style: TextStyle(fontSize: 16, color: Theme.of(context).cardColor),
          ),
          //SettingsWidget()
        ],
      ),
    ),
    actions: <Widget>[
      SizedBox(
        width: responsive.wp(35),
        child: CustomMaterialButton(
          paddingV: 10,
          paddingH: 10,
          color: Theme.of(context).cardColor,
          height: 36,
          child: Text(
            'Entendido',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    ],
  ));
}
