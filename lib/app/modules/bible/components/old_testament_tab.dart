part of '../views/bible_view.dart';

class _OldTestamentTab extends StatelessWidget {
  const _OldTestamentTab();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _BlibleCard(title: 'Genesis', numCaps: 50, nBook: 1, abbrev: 'gn'),
            _BlibleCard(title: 'Exodo', numCaps: 40, nBook: 2, abbrev: 'ex'),
            _BlibleCard(
                title: 'Leviticos', numCaps: 27, nBook: 3, abbrev: 'lv'),
            _BlibleCard(title: 'Numeros', numCaps: 36, nBook: 4, abbrev: 'nm'),
            _BlibleCard(
                title: 'Deuteronomios', numCaps: 34, nBook: 5, abbrev: 'dt'),
            _BlibleCard(title: 'Josue', numCaps: 24, nBook: 6, abbrev: 'js'),
            _BlibleCard(title: 'Jueces', numCaps: 21, nBook: 7, abbrev: 'jz'),
            _BlibleCard(title: 'Rut', numCaps: 4, nBook: 8, abbrev: 'rt'),
            _BlibleCard(
                title: '1 Samuel', numCaps: 31, nBook: 9, abbrev: '1sm'),
            _BlibleCard(
                title: '2 Samuel', numCaps: 24, nBook: 10, abbrev: '2sm'),
            _BlibleCard(
                title: '1 Reyes', numCaps: 22, nBook: 11, abbrev: '1rs'),
            _BlibleCard(
                title: '2 Reyes', numCaps: 25, nBook: 12, abbrev: '2rs'),
            _BlibleCard(
                title: '1 Crónicas', numCaps: 29, nBook: 13, abbrev: '1cr'),
            _BlibleCard(
                title: '2 Crónicas', numCaps: 36, nBook: 14, abbrev: '2cr'),
            _BlibleCard(title: 'Esdras', numCaps: 10, nBook: 15, abbrev: 'ed'),
            _BlibleCard(
                title: 'Nehemías', numCaps: 13, nBook: 16, abbrev: 'ne'),
            _BlibleCard(title: 'Ester', numCaps: 10, nBook: 17, abbrev: 'et'),
            _BlibleCard(title: 'Job', numCaps: 42, nBook: 18, abbrev: 'job'),
            _BlibleCard(title: 'Salmos', numCaps: 150, nBook: 19, abbrev: 'sl'),
            _BlibleCard(
                title: 'Proverbios', numCaps: 31, nBook: 20, abbrev: 'pv'),
            _BlibleCard(
                title: 'Eclesiastés', numCaps: 12, nBook: 21, abbrev: 'ec'),
            _BlibleCard(title: 'Cantares', numCaps: 8, nBook: 22, abbrev: 'ct'),
            _BlibleCard(title: 'Isaías', numCaps: 42, nBook: 23, abbrev: 'is'),
            _BlibleCard(
                title: 'Jeremías', numCaps: 52, nBook: 24, abbrev: 'jr'),
            _BlibleCard(
                title: 'Lamentaciones', numCaps: 5, nBook: 25, abbrev: 'lm'),
            _BlibleCard(
                title: 'Ezequiel', numCaps: 48, nBook: 26, abbrev: 'ez'),
            _BlibleCard(title: 'Daniel', numCaps: 12, nBook: 27, abbrev: 'dn'),
            _BlibleCard(title: 'Oseas', numCaps: 14, nBook: 28, abbrev: 'os'),
            _BlibleCard(title: 'Joel', numCaps: 3, nBook: 29, abbrev: 'jl'),
            _BlibleCard(title: 'Amós', numCaps: 9, nBook: 30, abbrev: 'am'),
            _BlibleCard(title: 'Abdías', numCaps: 1, nBook: 31, abbrev: 'ob'),
            _BlibleCard(title: 'Jonás', numCaps: 4, nBook: 32, abbrev: 'jn'),
            _BlibleCard(title: 'Miqueas', numCaps: 7, nBook: 33, abbrev: 'mq'),
            _BlibleCard(title: 'Nahúm', numCaps: 3, nBook: 34, abbrev: 'na'),
            _BlibleCard(title: 'Habacuc', numCaps: 3, nBook: 35, abbrev: 'hc'),
            _BlibleCard(title: 'Sofonías', numCaps: 3, nBook: 36, abbrev: 'sf'),
            _BlibleCard(title: 'Hageo', numCaps: 2, nBook: 37, abbrev: 'ag'),
            _BlibleCard(
                title: 'Zacarías', numCaps: 14, nBook: 38, abbrev: 'zc'),
            _BlibleCard(
                title: 'Malaquías', numCaps: 4, nBook: 39, abbrev: 'ml'),
          ],
        ),
      ),
    );
  }
}
