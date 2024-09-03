part of '../views/perfil_view.dart';



_themeDialog(BuildContext context){
  final responsive = Responsive(context);


  Get.dialog(
    AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(FontAwesomeIcons.userGear, color: Colors.white),
          SizedBox(width: 15),
          Text(
            'Cambio de tema',
           // style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
      content: SizedBox(
        width: responsive.wp(80),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Text(
              'El cambio de tema se relizará al volver a iniciar la app',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            //SettingsWidget()
          ],
        ),
      ),
      actions: <Widget>[
        /*SizedBox(
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
        ),*/
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
              'Entendido',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Get.back();
              
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
  ));

}