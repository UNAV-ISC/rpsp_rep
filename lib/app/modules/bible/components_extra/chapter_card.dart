part of '../views/bible_view2.dart';

class _ChapterCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final int contQuantity;
  final String abbv;

  const _ChapterCard(
      {required this.title,
      required this.onPressed,
      required this.contQuantity,
      required this.abbv});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xffF5F5F5),
        margin: const EdgeInsets.symmetric(vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ButtonCard(
          onTap: onPressed,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            trailing: const Text(
              'ver',
              style: TextStyle(
                  color: Color(0xffF5C00B),
                  fontWeight: FontWeight.w100,
                  fontSize: 10),
            ),
          ),
        ));
  }
}
