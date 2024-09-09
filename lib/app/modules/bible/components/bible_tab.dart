part of '../views/bible_view.dart';

class _BibleTab extends GetView<BibleController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          controller: _.tabController,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          indicatorColor: Theme.of(context).indicatorColor,
          tabs: [
            const Tab(text: 'Antiguo Testamento'),
            const Tab(text: 'Nuevo Testamento'),
          ]
              .map((label) => Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Tab(text: "${label.text}"),
                  ))
              .toList(),
        ),
        body: TabBarView(
          controller: _.tabController,
          children: const [_OldTestamentTab(), _NewTestamentTab()],
        ),
      ),
    );
  }
}
