part of '../views/bible_view2.dart';

class _BlibleCard extends StatelessWidget {
  final String title;
  final int numCaps;
  final int nBook;
  final String abbrev;

  const _BlibleCard(
      {required this.title,
      this.numCaps = 10,
      required this.nBook,
      required this.abbrev});

  @override
  Widget build(BuildContext context) {
    final _prefs = StoragePrefs();
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ButtonCard(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            // trailing: const Text(
            //   'ver',
            //   style: TextStyle(
            //       color: Color(0xffF5C00B),
            //       fontWeight: FontWeight.w100,
            //       fontSize: 10),
            // ),
          ),
          onTap: () {
            //print(abbrev);
            _bookModal(
                context: context, title: title, numCaps: numCaps, abbv: abbrev);
          }),
    );
  }
}
