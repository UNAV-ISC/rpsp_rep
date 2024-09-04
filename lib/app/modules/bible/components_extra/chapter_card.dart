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
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ButtonCard(
          onTap: onPressed,
          child: ListTile(
              title: Text(title), trailing: const Icon(Icons.chevron_right)),
        ));
  }
}
