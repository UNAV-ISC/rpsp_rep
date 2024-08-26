// part of '../views/prayers_list_view.dart';

// class _Tile extends GetView<PrayersListController> {
//   _Tile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _ = controller;

//     // final responsive = Responsive(context);
//     return Container(
//       // width: _.isShrink ? responsive.width * 0.6 : responsive.width * 0.5,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Lista de Peticiones',
//             style: TextStyle(
//               color: _.isShrink ? Colors.black : Colors.white,
//               fontSize: _.isShrink ? 18 : 16.0,
//               fontWeight: FontWeight.w800,
//             ),
//             maxLines: _.isShrink ? 1 : 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             today(),
//             style: TextStyle(
//                 color: _.isShrink ? Colors.black : Colors.white,
//                 fontSize: _.isShrink ? 12 : 13,
//                 fontWeight: FontWeight.w400),
//             maxLines: _.isShrink ? 1 : 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
