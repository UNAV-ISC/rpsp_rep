part of '../views/bible_view.dart';

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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ButtonCard(
          child: ListTile(
            title: Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            trailing: const Icon(Icons.chevron_right),
          ),
          onTap: () {
            //print(abbrev);
            _bookModal(
                context: context, title: title, numCaps: numCaps, abbv: abbrev);
          }),
    );
  }
}
