part of '../views/home_view.dart';

_bibleDialog(BuildContext context) {
  final responsive = Responsive(context);

  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Row(children: [
          Icon(FontAwesomeIcons.bookBible),
          SizedBox(width: 15),
          Text('Cita de Hoy', style: TextStyle(fontSize: 15))
        ]),
        Text(todayOnlyDay(),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
      ]),
      content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Jeremias1: 4-10', style: TextStyle(fontSize: 14)),
            Text('El llamado de Jeremias', style: TextStyle(fontSize: 16)),
          ]),
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomMaterialButton(
                color: Theme.of(context).cardColor,
                child: const Text('Escuchar'),
                onPressed: () {}),
            const SizedBox(height: 10),
            CustomMaterialButton(
                color: Theme.of(context).cardColor,
                child: const Text('Leer'),
                onPressed: () {
                  Get.back();
                  navigateTo(context, const BibleView());
                })
          ],
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
