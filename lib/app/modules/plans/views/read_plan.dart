import 'package:flutter/material.dart';

import 'package:rpsp_main/app/shared/global_widgets/page_with_sliver.dart';

class ReadPlanView extends StatelessWidget {
  final int index;
  final String text;
  const ReadPlanView({super.key, required this.index, required this.text});
  @override
  Widget build(BuildContext context) {
    return PageWithSliver(
        title: text,
        // titleColor: Colors.black,
        // dateColor: Colors.grey,
        isOpacityImage: true,
        titleFontSize: 15,
        dateFontSize: 10,
        imagePath: 'plans/$index.jpg',
        children: const [
          SizedBox(height: 10),
          Text(
            '''
Lorem ipsum dolor sit amet consectetur adipiscing elit euismod tristique, eros suspendisse dignissim conubia velit nostra lacus luctus lobortis curabitur, habitasse libero integer class porttitor ac ante proin. Accumsan taciti urna netus potenti orci platea convallis molestie litora, rhoncus sem dapibus diam lacus proin a dis, mollis venenatis dui sollicitudin eget nulla interdum vehicula. Parturient ut purus vel sagittis, lacus nisl litora, varius augue ultrices. Parturient class ut pharetra hendrerit lobortis morbi orci, eros ornare natoque habitant dictumst leo, quam donec rhoncus integer mollis hac.

Praesent montes accumsan semper vulputate commodo leo in placerat morbi, lacus conubia tristique dignissim sed varius curae ligula, convallis erat eleifend porttitor pulvinar euismod tincidunt tempus. Hac diam volutpat nisl rhoncus taciti urna est curae varius venenatis, sapien mus feugiat eros laoreet dignissim ante fusce sem potenti scelerisque, condimentum montes sagittis nunc tristique massa sociis primis imperdiet. Fames venenatis porta etiam nascetur mus semper, at rhoncus torquent sagittis.

Velit class rutrum porttitor vivamus quis suspendisse, nascetur eget non rhoncus faucibus imperdiet aptent, nostra ad ut mattis litora. Purus leo tristique dictum congue dictumst aliquet proin, nostra fringilla nascetur imperdiet platea lobortis in sed, parturient maecenas blandit sodales class faucibus. Semper turpis auctor vulputate quam nullam laoreet fringilla interdum integer metus, proin dis purus scelerisque sociis facilisi nunc suspendisse lacinia tincidunt, lacus arcu convallis condimentum et venenatis augue magnis eros.

Eget hac orci condimentum proin dui bibendum, ante augue mi dapibus cum rutrum, sociosqu tortor pretium fermentum suscipit. Iaculis auctor non hac quam cubilia lacus mattis per facilisis, fringilla risus placerat aenean vivamus vulputate lectus congue diam erat, tellus aptent fermentum convallis aliquet dapibus cursus arcu. Metus praesent tristique sagittis faucibus malesuada luctus erat facilisi tempus, pulvinar euismod quam feugiat libero cursus sociosqu class, duis at vivamus bibendum potenti platea aliquam habitasse.
 ''',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ]);
  }
}
