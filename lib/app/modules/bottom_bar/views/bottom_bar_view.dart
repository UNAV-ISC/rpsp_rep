import 'package:flutter/material.dart';
import 'package:rpsp_main/app/modules/bible/views/bible_view.dart';
import 'package:rpsp_main/app/modules/bible/views/bible_view2.dart';
import 'package:rpsp_main/app/modules/blog/views/blog_view.dart';
import 'package:rpsp_main/app/modules/home/views/home_view.dart';
import 'package:rpsp_main/app/modules/perfil/views/perfil_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpsp_main/app/shared/share_prefs/storage_prefs.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _currentIndex = 1;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
///change
final _prefs = StoragePrefs();
    return WillPopScope(
      onWillPop: () async => _onWillPop(context),
      child: Scaffold(
        backgroundColor: _prefs.isDarkMode? const Color.fromARGB(255, 41, 61, 77):const Color.fromARGB(255, 255, 255, 255),
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            Navigator(
              key: _page1,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route, builder: (context) => ProfileView()),
            ),
            Navigator(
              key: _page2,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route, builder: (context) => const HomeView()),
            ),
            Navigator(
              key: _page3,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route, builder: (context) => const BibleView2()),
            ),
            Navigator(
              key: _page4,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route, builder: (context) => BlogView()),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          // shape: const CircularNotchedRectangle(),

          elevation: 10,
          color: const Color(0xffF3F4F8),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            iconSize: 25,
            elevation: 20,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold ),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
            backgroundColor: const Color(0xffF3F4F8),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              // switch (index) {
              //   case 0:
              //     Get.toNamed(Routes.PROFILE);
              //     break;
              //   case 1:
              //     Get.toNamed(Routes.HOME);
              //     break;
              //   case 2:
              //     Get.toNamed(Routes.EDIT_PROFILE);
              //     break;
              //   case 3:
              //     Get.toNamed(Routes.EDIT_PROFILE);
              //     break;
              // }
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Perfil' ),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bookBible), label: 'Biblia'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sell_sharp), label: 'Blog'),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            elevation: 50,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const Text(
              '¿Estás seguro qué deseas salir de la app?',
            ),
            //content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  // style: TextStyle(color: textColor),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Sí',
                  // style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}



// import 'package:flutter/material.dart';
// import 'package:rpsp/app/modules/edit_profile/views/edit_profile_view.dart';
// import 'package:rpsp/app/modules/home/views/home_view.dart';

// enum TabItem { perfil, inicio, favoritos, planes }

// const Map<TabItem, String> tabName = {
//   TabItem.perfil: 'Perfil',
//   TabItem.inicio: 'Inicio',
//   TabItem.favoritos: 'Favoritos',
//   TabItem.planes: 'Planes',
// };

// //

// class BottomBarView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => BottomBarViewState();
// }

// class BottomBarViewState extends State<BottomBarView> {
//   var _currentTab = TabItem.inicio;
//   final _navigatorKeys = {
//     TabItem.perfil: GlobalKey<NavigatorState>(),
//     TabItem.inicio: GlobalKey<NavigatorState>(),
//     TabItem.favoritos: GlobalKey<NavigatorState>(),
//     TabItem.planes: GlobalKey<NavigatorState>(),
//   };

//   void _selectTab(TabItem tabItem) {
//     if (tabItem == _currentTab) {
//       // pop to first route
//       _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
//     } else {
//       setState(() => _currentTab = tabItem);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//             !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
//         if (isFirstRouteInCurrentTab) {
//           // if not on the 'main' tab
//           if (_currentTab != TabItem.inicio) {
//             // select 'main' tab
//             _selectTab(TabItem.inicio);
//             // back button handled by app
//             return false;
//           }
//         }
//         // let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       child: Scaffold(
//         body: Stack(children: <Widget>[
//           EditProfileView(),
//           _buildOffstageNavigator(TabItem.inicio),
//           // HomeView(),
//           _buildOffstageNavigator(TabItem.favoritos),

//           _buildOffstageNavigator(TabItem.planes),
//         ]),
//         bottomNavigationBar: BottomNavigation(
//           currentTab: _currentTab,
//           onSelectTab: _selectTab,
//         ),
//       ),
//     );
//   }

//   Widget _buildOffstageNavigator(TabItem tabItem) {
//     return Offstage(
//       offstage: _currentTab != tabItem,
//       child: TabNavigator(
//         navigatorKey: _navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }

// class BottomNavigation extends StatelessWidget {
//   BottomNavigation({required this.currentTab, required this.onSelectTab});
//   final TabItem currentTab;
//   final ValueChanged<TabItem> onSelectTab;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: [
//         _buildItem(
//             context: context, tabItem: TabItem.perfil, icon: Icons.person),
//         _buildItem(
//             context: context, tabItem: TabItem.inicio, icon: Icons.favorite),
//         _buildItem(
//             context: context, tabItem: TabItem.favoritos, icon: Icons.home),
//         _buildItem(
//             context: context, tabItem: TabItem.planes, icon: Icons.sell_sharp),
//       ],
//       onTap: (index) => onSelectTab(TabItem.values[index]),
//       currentIndex: currentTab.index,
//       selectedItemColor: Theme.of(context).primaryColor,
//     );
//   }

//   BottomNavigationBarItem _buildItem(
//       {required BuildContext context,
//       required TabItem tabItem,
//       required IconData icon}) {
//     return BottomNavigationBarItem(
//       icon: Icon(
//         icon,
//         color: currentTab == tabItem
//             ? Theme.of(context).primaryColor
//             : Colors.grey,
//       ),
//       label: tabName[tabItem],
//     );
//   }

//   // Color _colorTabMatching(TabItem item) {
//   //   return currentTab == item ? activeTabColor[item]! : Colors.grey;
//   // }
// }

// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }

// class TabNavigator extends StatelessWidget {
//   TabNavigator({required this.navigatorKey, required this.tabItem});
//   final GlobalKey<NavigatorState>? navigatorKey;
//   final TabItem tabItem;

//   void _push(BuildContext context, {int materialIndex: 500}) {
//     var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             routeBuilders[TabNavigatorRoutes.detail]!(context),
//       ),
//     );
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
//       {int materialIndex: 500}) {
//     return {
//       TabNavigatorRoutes.root: (context) => ColorsListPage(
//             onPush: (materialIndex) =>
//                 _push(context, materialIndex: materialIndex),
//           ),
//       TabNavigatorRoutes.detail: (context) => ColorDetailPage(
//             materialIndex: materialIndex,
//           ),
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.root,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//           builder: (context) => routeBuilders[routeSettings.name!]!(context),
//         );
//       },
//     );
//   }
// }

// class ColorDetailPage extends StatelessWidget {
//   ColorDetailPage({this.materialIndex: 500});
//   final int materialIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '$materialIndex',
//         ),
//       ),
//       // body: Container(
//       //   color: color[materialIndex],
//       // ),
//     );
//   }
// }

// class ColorsListPage extends StatelessWidget {
//   ColorsListPage({this.onPush});
//   final ValueChanged<int>? onPush;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Container(
//           color: Colors.white,
//           child: _buildList(),
//         ));
//   }

//   Widget _buildList() {
//     return ListView.separated(
//         itemCount: 10,
//         separatorBuilder: (_, index) => Divider(),
//         itemBuilder: (BuildContext content, int index) {
//           return Container(
//             color: Colors.brown,
//             child: ListTile(
//               title: Text('$index', style: TextStyle(fontSize: 24.0)),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () => onPush?.call(index),
//             ),
//           );
//         });
//   }
// }
