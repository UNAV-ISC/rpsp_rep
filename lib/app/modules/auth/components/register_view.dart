part of '../views/auth_view.dart';

class _RegisterView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Scaffold(
        body: Form(
      autovalidateMode: AutovalidateMode.always,
      key: _.formKeyregister,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              NameLogoApp(color: Theme.of(context).canvasColor),
              const SizedBox(height: 50),
              const Text(
                'Ingresa tu correo para unirte a nuestra comunidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: _.emailTextController,
                hintText: 'micorreo@gmail.com',
                textInputType: TextInputType.text,
                validator: (value) {
                  if (!value!.isEmail) return 'Email no válido'.tr;

                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomMaterialButton(
                child: const Text('continuar con correo',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () => _.goToPage(2),
              ),
              const SizedBox(height: 80),
              CustomMaterialButton(
                  color: const Color(0xff4167B2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: 20),
                      Icon(FontAwesomeIcons.facebook, color: Colors.white),
                      SizedBox(width: 20),
                      Text('seguir con facebook',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                  onPressed: () => _.goToPage(1)),
              const SizedBox(height: 10),
              // _.goToPage(1),
            ],
          ),
        ),
      ),
    ));
  }
}
