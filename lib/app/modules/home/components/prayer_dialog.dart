part of '../views/home_view.dart';

_prayerDialog(BuildContext context) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(FontAwesomeIcons.handsPraying, color: Colors.white),
          const SizedBox(width: 15),
          const Text(
            'Oración',
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Text(
            todayOnlyDay(),
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w200),
          )
        ],
      ),
      content: const Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'La oración es el puente que nos une a la patria celestial y es por ello que no debe de fallar en nuestra vida',
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
          //SettingsWidget()
        ],
      ),
      actions: <Widget>[
        CustomMaterialButton(
          paddingV: 10,
          paddingH: 5,
          // height: 40,
          color: Colors.white,
          child: const Text(
            'Ver Listas de Peticiones',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Get.back();
            navigateTo(context, const PrayersListView());
          },
        ),
      ],
    ),
    barrierDismissible: true,
  );
}
