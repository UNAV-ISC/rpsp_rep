part of '../views/auth_view.dart';

class _PerfilPhotoView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Scaffold(
      body: Padding(
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
                'Foto de perfil',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Selecciona una foto para que la comunidad te reconozca',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            // _SelectAndUploadImage(),
            GetBuilder<AuthController>(
              id: 'avatar',
              builder: (_) => AvatarImage(
                file: _.file,
                captureImage: _.captureImage,
                selectImage: _.selectImageFromGallery,
              ),
            ),

            const Spacer(),
            CustomMaterialButton(
              onPressed: _navigateToBottomBar,
              child: const Text('OMITIR',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 20),
            CustomMaterialButton(
              onPressed: _navigateToBottomBar,
              child: const Text('TERMINAR',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w800)),
            ),

            const SizedBox(height: 40),
            // _.goToPage(1),
          ],
        ),
      ),
    );
  }

  _navigateToBottomBar() => Get.offNamed(Routes.bottomBar);
}
