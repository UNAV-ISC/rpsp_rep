part of 'package:rpsp_main/app/modules/onboarding/views/onboarding_view.dart';

class OnboardingItems extends StatelessWidget {
  final _ = Get.put(OnboardingController());

  OnboardingItems({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _.onboardingPages.length,
        (index) => Obx(
          () {
            return Container(
              margin: const EdgeInsets.all(4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  color: _.selectedPageIndex.value == index
                      ? Colors.greenAccent
                      : Colors.white,
                  shape: BoxShape.circle),
            );
          },
        ),
      ),
    );
  }
}
