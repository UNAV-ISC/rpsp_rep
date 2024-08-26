// part of '../views/auth_view.dart';

// class _SelectAndUploadImage extends GetView<AuthController> {
//   final kColor1 = Color(0xffE6E6E6);
//   final kColor2 = Color(0xffCFCFCF);

//   final bigRadius = 80.0;
//   final smallRadius = 73.0;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(
//       id: 'avatar',
//       builder: (_) => MaterialButton(
//         elevation: 5,
//         color: Colors.white,
//         shape: CircleBorder(),
//         height: 2 * bigRadius,
//         minWidth: 2 * bigRadius,
//         child: CircleAvatar(
//           backgroundColor: kColor2,
//           radius: bigRadius,
//           child: GetBuilder<AuthController>(
//             id: 'image_dialog',
//             builder: (_) => _.file.path != ''
//                 ? CircleAvatar(
//                     radius: smallRadius,
//                     backgroundColor: kColor1,
//                     backgroundImage: Image.file(
//                       _.file,
//                       fit: BoxFit.cover,
//                     ).image,
//                   )
//                 : CircleAvatar(
//                     radius: smallRadius,
//                     backgroundColor: kColor1,
//                     child: Icon(
//                       FontAwesomeIcons.camera,
//                       color: kColor2,
//                       size: 50,
//                     )),
//           ),
//         ),
//         onPressed: selectImageModal,
//       ),
//     );
//   }

//   selectImageModal() {
//     final _ = controller;
//     Get.bottomSheet(
//       Container(
//         height: 200,
//         color: Colors.transparent,
//         child: Container(
//           child: Ink(
//               padding: EdgeInsets.only(top: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(40),
//                   topLeft: Radius.circular(40),
//                 ),
//                 color: Color(0xFF3E6F89),
//               ),
//               height: 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _CustomButton(text: 'CAMARA', onPressed: _.captureImage),
//                   _CustomButton(
//                       text: 'GALERIA', onPressed: _.selectImageFromGallery),
//                   _CustomButton(text: 'CANCELAR', onPressed: () {}),
//                   SizedBox(height: 5),
//                 ],
//               )),
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       enableDrag: false,
//     );
//   }
// }

// class _CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   const _CustomButton({required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     final textStyleModal = TextStyle(color: Colors.white, fontSize: 17);
//     return TextButton(
//       style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(250, 50))),
//       child: Text(this.text, style: textStyleModal),
//       onPressed: () {
//         Get.back();
//         this.onPressed();
//       },
//     );
//   }
// }
