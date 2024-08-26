// // enum AuthStatus { checking, authenticated, notAuthenticated }
// import 'dart:convert';
// import 'package:flutter_sud_solution_viajes/app/data/http/BaseAPI.dart';
// import 'package:flutter_sud_solution_viajes/app/data/http/url.dart';
// import 'package:flutter_sud_solution_viajes/app/data/manage_exceptions/handle_api_expections.dart';
// import 'package:flutter_sud_solution_viajes/app/data/models/models/login_response.dart';
// import 'package:flutter_sud_solution_viajes/app/data/models/models/user_date.dart';
// import 'package:flutter_sud_solution_viajes/app/routes/app_pages.dart';
// import 'package:flutter_sud_solution_viajes/app/shared/global_widgets/dialogs/custom_dialog.dart';
// import 'package:flutter_sud_solution_viajes/app/shared/global_widgets/dialogs/dialog_loading.dart';
// import 'package:flutter_sud_solution_viajes/app/shared/share_prefs/storage_prefs.dart';
// import 'package:get/get.dart';

// class AuthProvider extends GetxService with HandleAPIExeptions {
//   UserDate? user;
//   final _prefs = StoragePrefs();

//   // Future<bool> isAuthenticated() async {
//   //   bool auth = false;
//   //   print('Comprobando si el token es valido.');
//   //   final request = BaseAPI(url: );
//   //   await request.get().then((value) {
//   //     if (value.statusCode == 200) {
//   //       print('Token valido');
//   //       auth = true;
//   //     } else {
//   //       print('Token no valido!!!');
//   //       auth = false;
//   //     }
//   //   }).catchError(handleError);
//   //   return auth;
//   // }

//   Future<bool> login(
//       {required String username, required String password}) async {
//     bool resp = false;
//     dialogLoading();

//     final data = {"username": username, "password": password};

//     BaseAPI request = BaseAPI(url: URLS.LOGIN, body: jsonEncode(data));
//     await request.post().then((value) async {
//       if (value.statusCode == 200) {
//         print(value.body);
//         final loginResponse = loginResponseFromJson(value.body);
//         _savePersonalData(loginResponse);
//         print('nombre: ' + loginResponse.userDate.usName);
//         if (Get.isDialogOpen!) Get.back();
//         resp = true;
//       } else {
//         Get.back();

//         customDialog(
//             text: 'El usuario o contraseña no son correctos', action: () {});
//         resp = false;
//       }
//     }).catchError(handleError);
//     return resp;
//   }

//   // Future<bool> register({required Map data}) async {
//   //   bool resp = false;
//   //   dialogLoading();

//   //   final request = BaseAPI(url: urlRegister, body: jsonEncode(data));
//   //   await request.post().then((value) {
//   //     Get.back();
//   //     if (value.statusCode == 200) {
//   //       final registerResponse = registerResponseFromJson(value.body);
//   //       _prefs.uid = registerResponse.usuario.uid!;

//   //       resp = true;
//   //     } else {
//   //       resp = false;
//   //       final respBody = register404ResponseFromJson(value.body);
//   //       customDialog(text: respBody.errors[0].msg, action: () {});
//   //     }
//   //   }).catchError(handleError);

//   //   return resp;
//   // }

//   _savePersonalData(LoginResponse loginResponse) {
//     _prefs.token = loginResponse.authToken;
//   }

//   logout() async {
//     _prefs.token = '';
//     Get.offNamed(Routes.LOGIN);
//   }
// }
