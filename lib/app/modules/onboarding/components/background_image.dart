part of 'package:rpsp_main/app/modules/onboarding/views/onboarding_view.dart';

class BackgroundImage extends StatelessWidget {
  final int index;
  const BackgroundImage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage('assets/onboarding/image$index.jpg'),
        colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.darken),
        fit: BoxFit.cover,
      )),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(),
      ),
    );
  }
}
