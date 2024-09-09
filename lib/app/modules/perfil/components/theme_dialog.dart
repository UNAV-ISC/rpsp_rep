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
              'Reinicia la aplicacion para confirmar el cambio de tema',
              style: TextStyle(fontSize: 18, color: Colors.white),
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
            color: const Color.fromARGB(255, 77, 77, 77),
            
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
        
      ],
  ));

}