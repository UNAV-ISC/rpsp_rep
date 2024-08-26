part of '../views/edit_profile_view.dart';

class _AvatarImage extends GetView<EditProfileController> {
  const _AvatarImage();

  @override
  Widget build(BuildContext context) {
    final _ = controller;

    return AvatarImage(
      bigRadius: 86,
      externalColor: Colors.white,
      file: _.file,
      captureImage: _.captureImage,
      selectImage: _.selectImageFromGallery,
    );
  }
}
