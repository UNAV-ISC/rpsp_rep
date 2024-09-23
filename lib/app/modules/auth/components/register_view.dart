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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              NameLogoApp(color: Theme.of(context).primaryColor),
              const SizedBox(height: 50),
              const Text('Ya tienes una cuenta?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              const SizedBox(height: 20),
              TextFieldCustom(
                  backgroundColor: Theme.of(context).cardColor,
                  controller: _.numberTextController,
                  hintText: '999 999 999',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (!value!.isPhoneNumber) return 'Numero no válido'.tr;
                    return null;
                  }),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              CustomMaterialButton(
                borderRadius: 20,
                onPressed: _navigateToBottomBar,
                child: const Text('Ingresar',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              CustomMaterialButton(
                borderRadius: 20,
                child: const Text('Registrarme',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () => _.goToPage(1),
              ),
              const SizedBox(height: 20),
              CustomMaterialButton(
                  borderRadius: 20,
                  color: const Color(0xff4167B2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.facebook, color: Colors.white),
                      SizedBox(width: 20),
                      Text('Seguir con Facebook',
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

  _navigateToBottomBar() => Get.offNamed(Routes.bottomBar);
}
