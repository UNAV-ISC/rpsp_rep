part of '../views/home_view.dart';

_bibleDialog(BuildContext context) {
  final responsive = Responsive(context);

  Get.dialog(
    AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(FontAwesomeIcons.bookBible, color: Colors.white),
          const SizedBox(width: 15),
          const Text(
            'Cita de Hoy',
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
      content: SizedBox(
        width: responsive.wp(80),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Jeremias1: 4-10',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              'El llamado de Jeremias',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            //SettingsWidget()
          ],
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: responsive.wp(35),
          // color: Colors.red,
          child: CustomMaterialButton(
            paddingV: 10,
            color: Colors.white,
            paddingH: 10,
            height: 36,
            child: const Text('Escuchar'),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: responsive.wp(35),
          // color: Colors.yellow,
          child: CustomMaterialButton(
            paddingV: 10,
            paddingH: 10,
            color: Colors.white,
            // width: 120,
            height: 36,
            child: const Text(
              'Leer',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Get.back();
              navigateTo(context, const BibleView());
            },
          ),
        ),
        // CustomMaterialButton(
        //   paddingV: 10,
        //   paddingH: 5,
        //   // height: 40,
        //   color: Colors.white,
        //   child: Text(
        //     'Ver Listas de Peticiones',
        //     style: TextStyle(fontWeight: FontWeight.w700),
        //   ),
        //   onPressed: () {
        //     Get.back();
        //     navigateTo(context, BibleView());
        //   },
        // ),
      ],
    ),
    barrierDismissible: true,
  );
}
