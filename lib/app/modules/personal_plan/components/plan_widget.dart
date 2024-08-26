part of '../views/personal_plan_view.dart';

class _PlanWidget extends GetView<PersonalPlanController> {
  final int index;
  final String text;

  const _PlanWidget({required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    // final responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/plans/$index.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            // width: 150,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // _AddButton(),
              _CustomButton(),
              SizedBox(width: 10),
              _CustomButton(isPLus: false),
              // _SubstractButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final bool isPLus;

  const _CustomButton({this.isPLus = true});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      height: 50,
      minWidth: 40,
      color: isPLus ? Theme.of(context).primaryColor : Colors.white,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(0),
      child: Icon(isPLus ? FontAwesomeIcons.plus : FontAwesomeIcons.minus,
          size: 20, color: isPLus ? Colors.white : Colors.black),
      onPressed: () {},
    );
  }
}
