// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rpsp/app/data/providers/auth_provider.dart';

// class LogoutButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         GestureDetector(
//             onTap: () {
//               _shwowDialog(onPressedYes: () {
//                 final _ = Get.put(AuthProvider());
//                 _.logout();
//               });
//             },
//             child: const Icon(Icons.exit_to_app_outlined,
//                 color: Color.fromARGB(255, 66, 98, 134), size: 24))
//       ],
//     );
//   }

//   _shwowDialog({required VoidCallback onPressedYes}
//       //   {
//       //   String title = '',
//       //   required String text,
//       //   bool error = true,
//       //   required Function action,
//       //   bool dismissible = true,
//       // }
//       ) {
//     Get.dialog(
//       AlertDialog(
//         scrollable: true,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         title: Text(
//           "Cerrar Sesion",
//           style: TextStyle(fontSize: 28),
//           textAlign: TextAlign.center,
//         ),
//         content: Column(
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Presione Si para cerrar sesion",
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             )
//             //SettingsWidget()
//           ],
//         ),
//         actions: <Widget>[
//           new TextButton(
//             onPressed: () => Get.back(),
//             child: new Text(
//               'No',
//               // style: TextStyle(color: textColor),
//             ),
//           ),
//           new TextButton(
//             onPressed: () {
//               if (Get.isDialogOpen!) Get.back();
//               onPressedYes();
//             },
//             child: new Text(
//               'Sí',
//               // style: TextStyle(color: textColor),
//             ),
//           )
//         ],
//       ),
//       barrierDismissible: true,
//     );

//     // return showDialog(
//     //   context: context,
//     //   builder: (context) => new AlertDialog(
//     //     elevation: 50,
//     //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     //     title: new Text(
//     //       '¿Estás seguro qué deseas salir de la app?',
//     //     ),
//     //     //content: new Text('Do you want to exit an App'),
//     //     actions: <Widget>[
//     //       new TextButton(
//     //         onPressed: () => Navigator.of(context).pop(false),
//     //         child: new Text(
//     //           'No',
//     //           // style: TextStyle(color: textColor),
//     //         ),
//     //       ),
//     //       new TextButton(
//     //         onPressed: () => Navigator.of(context).pop(true),
//     //         child: new Text(
//     //           'Sí',
//     //           // style: TextStyle(color: textColor),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
// }
