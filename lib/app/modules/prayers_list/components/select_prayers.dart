part of '../views/add_prayers_list_view.dart';

class _SelectPrayers extends GetView<PrayersListController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 350,
              width: double.infinity,
              child: GetBuilder<PrayersListController>(
                id: 'prayers_list',
                builder: (_) {
                  return Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft, child: _TodayWidget()),
                      // Obx(() =>),
                      _PrayerItem(
                        value: _.selecteds[0],
                        text: 'Salud de mis familiares',
                        onPressed: (value) => _.selecteds[0] = value,
                      ),
                      _PrayerItem(
                        value: _.selecteds[1],
                        text: 'Planes familiares y personales',
                        onPressed: (value) => _.selecteds[1] = value,
                      ),
                      _PrayerItem(
                        value: _.selecteds[2],
                        text: 'Familia Ruiz Lopez',
                        onPressed: (value) => _.selecteds[2] = value,
                      ),
                      _PrayerItem(
                        value: _.selecteds[3],
                        text: 'Adminstrativos y Dirigentes de la Iglesia',
                        onPressed: (value) => _.selecteds[3] = value,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 120,
              // color: Colors.red,
              child: CustomMaterialButton(
                width: 120,
                height: 36,
                child: const Text('Guardar', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PrayerItem extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool> onPressed;

  _PrayerItem(
      {required this.value, required this.text, required this.onPressed});

  final _ = Get.put(PrayersListController());

  @override
  Widget build(BuildContext context) {
    bool isSelected = value;
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      trailing: isSelected ? _selectedItem(context) : _disabledItem(context),
      //  _selectedItem(context),
      onTap: () {
        isSelected = !isSelected;
        onPressed(isSelected);
        _.update(['prayers_list']);
      },
    );
  }

  Widget _selectedItem(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).indicatorColor,
      radius: 14,
    );
  }

  Widget _disabledItem(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.black,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).hintColor,
        radius: 14,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 11,
        ),
      ),
    );
  }
}
