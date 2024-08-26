part of '../views/home_view.dart';


class _HomeCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String rightText;
  final VoidCallback onPressed;
  
  //final bool theme;

  const _HomeCard({
    required this.icon,
    required this.title,
    this.rightText = '',
    required this.onPressed,
    //required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final _prefs = StoragePrefs();
     

    return Card(
      color: const Color(0xffF5F5F5),
      //color: _prefs.isDarkMode ? Colors.grey : Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: _ButtonCard(
        onTap: onPressed,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          //visualDensity: VisualDensity.compact,
          // contentPadding: EdgeInsets.only(left: 15, right: 0),
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: _prefs.isDarkMode ? Colors.grey : Colors.black), 
          ),
          trailing: Text(
            rightText,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 13, color: _prefs.isDarkMode ? Colors.grey : Colors.black),
          ),
        ),
      ),
    );
  }
}

class _ButtonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const _ButtonCard({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      child: child,
    );
  }
}
