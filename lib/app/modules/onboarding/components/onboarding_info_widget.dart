part of 'package:rpsp_main/app/modules/onboarding/views/onboarding_view.dart';

class OnboardingInfoWidget extends StatelessWidget {
  final OnBoardingInfoModel onBoardingInfoModel;

  const OnboardingInfoWidget(this.onBoardingInfoModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(onBoardingInfoModel.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Text(onBoardingInfoModel.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }
}
