part of '../views/add_prayers_list_view.dart';

class _AddTextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          PhysicalModel(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            elevation: 5.0,
            shadowColor: Colors.black,
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white,
                hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
                focusColor: Colors.green,
                // prefixIcon: SizedBox(width: 1),
                hintText:
                    'Agregar motivo que desea poner en petición por medio de oración.',
                hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
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
                child: const Text('Agregar', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
