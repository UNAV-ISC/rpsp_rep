part of '../views/auth_view.dart';

class _NameView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _.formKeyName,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              NameLogoApp(color: Theme.of(context).primaryColor),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cúal es tu Nombre?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Ingresa solo tu nombre para para completar tu perfil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                backgroundColor: const Color(0xffFCFCFC),
                controller: _.nameTextController,
                hintText: 'Nombre',
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'El nombre es requerido';
                  }
                  return null;
                },
              ),
              const Spacer(),
              CustomMaterialButton(
                child: const Text('SIGUIENTE',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () => _.goToPage(3),
              ),

              const SizedBox(height: 40),
              // _.goToPage(1),
            ],
          ),
        ),
      ),
    );
  }
}
