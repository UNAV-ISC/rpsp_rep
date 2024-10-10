part of '../views/demo.dart';

class _DemoCard extends StatelessWidget {
  final Widget image;
  final String title;
  final String rightText;
  final VoidCallback onPressed;

  const _DemoCard({
    required this.image,
    required this.title,
    this.rightText = '',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: _ButtonCard(
        onTap: onPressed,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20),
          image,
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
        ]),
        // ListTile(
        //   contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        //   leading: icon,
        //   title: Text(
        //     title,
        //     style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        //   ),
        //   trailing: Text(
        //     rightText,
        //     style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
        //   ),
        // ),
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
      onPressed: onTap,
      child: child,
    );
  }
}
