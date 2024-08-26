part of '../views/bible_view.dart';

class _NewTestamentTab extends StatelessWidget {
  const _NewTestamentTab();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _BlibleCard(title: 'Mateo', numCaps: 28, nBook: 40, abbrev: 'mt'),
            _BlibleCard(title: 'Marcos', numCaps: 16, nBook: 41, abbrev: 'mc'),
            _BlibleCard(title: 'Lucas', numCaps: 24, nBook: 42, abbrev: 'lc'),
            _BlibleCard(title: 'Juan', numCaps: 21, nBook: 43, abbrev: 'jo'),
            _BlibleCard(title: 'Hechos', numCaps: 28, nBook: 44, abbrev: 'at'),
            _BlibleCard(title: 'Romanos', numCaps: 16, nBook: 45, abbrev: 'rm'),
            _BlibleCard(
                title: '1 Corintios', numCaps: 16, nBook: 46, abbrev: '1co'),
            _BlibleCard(
                title: '2 Corintios', numCaps: 13, nBook: 47, abbrev: '2co'),
            _BlibleCard(title: 'Gálatas', numCaps: 6, nBook: 48, abbrev: 'gl'),
            _BlibleCard(title: 'Efesios', numCaps: 6, nBook: 49, abbrev: 'ef'),
            _BlibleCard(
                title: 'Filipenses', numCaps: 4, nBook: 50, abbrev: 'fp'),
            _BlibleCard(
                title: 'Colosenses', numCaps: 4, nBook: 51, abbrev: 'cl'),
            _BlibleCard(
                title: '1 Tesalonicenses',
                numCaps: 5,
                nBook: 52,
                abbrev: '1ts'),
            _BlibleCard(
                title: '2 Tesalonicenses',
                numCaps: 3,
                nBook: 53,
                abbrev: '2ts'),
            _BlibleCard(
                title: '1 Timoteo', numCaps: 6, nBook: 54, abbrev: '1tm'),
            _BlibleCard(
                title: '2 Timoteo', numCaps: 4, nBook: 55, abbrev: '2tm'),
            _BlibleCard(title: 'Tito', numCaps: 3, nBook: 56, abbrev: 'tt'),
            _BlibleCard(title: 'Filemón', numCaps: 1, nBook: 57, abbrev: 'fm'),
            _BlibleCard(title: 'Hebreos', numCaps: 13, nBook: 58, abbrev: 'hb'),
            _BlibleCard(title: 'Santiago', numCaps: 5, nBook: 59, abbrev: 'tg'),
            _BlibleCard(title: '1 Pedro', numCaps: 5, nBook: 60, abbrev: '1pe'),
            _BlibleCard(title: '2 Pedro', numCaps: 3, nBook: 61, abbrev: '2pe'),
            _BlibleCard(title: '1 Juan', numCaps: 5, nBook: 62, abbrev: '1jo'),
            _BlibleCard(title: '2 Juan', numCaps: 1, nBook: 63, abbrev: '2jo'),
            _BlibleCard(title: '3 Juan', numCaps: 1, nBook: 64, abbrev: '3jo'),
            _BlibleCard(title: 'Judas', numCaps: 1, nBook: 65, abbrev: 'jd'),
            _BlibleCard(
                title: 'Apocalipsis', numCaps: 22, nBook: 66, abbrev: 'ap'),
          ],
        ),
      ),
    );
  }
}
