part of '../views/bible_view2.dart';



class _BibleTab extends GetView<BibleController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;
    final _prefs = StoragePrefs();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        ///Cambios de tema
        backgroundColor: _prefs.isDarkMode? const Color.fromARGB(255, 41, 61, 77):const Color.fromARGB(255, 255, 255, 255),
        /////
        appBar: TabBar(
          controller: _.tabController,
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          labelColor: _prefs.isDarkMode? Colors.white:Colors.black,
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1.5,
                color: Color(0xffF5C00B),
              ),
              insets: EdgeInsets.only(left: 0, right: 15, bottom: 12)),
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 0, right: 0),
          tabs: [
            const Tab(text: 'Antiguo Testamento'),
            const Tab(text: 'Nuevo Testamento'),
          ]
              .map((label) => Padding(
                    padding: const EdgeInsets.only(right: 15),
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
