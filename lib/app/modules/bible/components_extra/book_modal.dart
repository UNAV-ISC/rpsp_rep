part of '../views/bible_view2.dart';

_bookModal({
  required BuildContext context,
  required String title,
  required int numCaps,
  required String abbv,
  int contQuantity = 0,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.folder),
              const SizedBox(width: 2),
              Text('$numCaps Capítulos')
            ]),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                    itemCount: numCaps,
                    itemBuilder: (_, index) {
                      final kSubTitle = 'Capítulo ${index + 1}';
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _ChapterCard(
                          title: kSubTitle,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => TextView(
                                    title: title,
                                    subTitle: kSubTitle,
                                    contQuantity: contQuantity,
                                    abbv: abbv),
                              ),
                            );
                            contQuantity = index + 1;
                          },
                          contQuantity: contQuantity,
                          abbv: abbv,
                        ),
                      );
                    })),
          ],
        )),
  );
}

// _bookModal2({
//   required String title,
//   int capsQuantity = 10,
// }) {
//   Get.bottomSheet(
//     Container(
//       height: 600,
//       color: Colors.transparent,
//       child: Ink(
//           padding: EdgeInsets.only(top: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(40),
//               topLeft: Radius.circular(40),
//             ),
//             color: Colors.white,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 10),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.folder,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(width: 2),
//                   Text('$capsQuantity Capítulos'),
//                 ],
//               ),
//               Expanded(
//                   child: ListView.builder(
//                 itemCount: capsQuantity,
//                 itemBuilder: (_, index) => Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: _ChapterCard(
//                       title: 'Capítulo ${index + 1}', onPressed: () {}),
//                 ),
//               )),
//             ],
//           )),
//     ),
//     backgroundColor: Colors.transparent,
//     enableDrag: false,
//   );
// }
