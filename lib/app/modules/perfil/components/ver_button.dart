part of '../views/perfil_view.dart';

class _VerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: Colors.white,
        fixedSize: const Size(80, 30),
        backgroundColor: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
      ),
      child: const Text(
        "Ver",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      onPressed: () {},
    );
  }
}
