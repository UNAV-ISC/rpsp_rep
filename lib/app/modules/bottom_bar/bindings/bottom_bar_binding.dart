import 'package:get/get.dart';
import 'package:rpsp_main/app/modules/bible/controllers/bible_controller.dart';
//import 'package:rpsp_main/app/modules/blog/views/blog_view.dart';
import 'package:rpsp_main/app/modules/edit_profile/controllers/edit_profile_controller.dart';

import 'package:rpsp_main/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:rpsp_main/app/modules/home/controllers/home_controller.dart';

import 'package:rpsp_main/app/modules/perfil/controllers/perfil_controller.dart';
import 'package:rpsp_main/app/modules/personal_plan/controllers/personal_plan_controller.dart';
import 'package:rpsp_main/app/modules/plans/controllers/plans_controller.dart';
import 'package:rpsp_main/app/modules/prayers_list/controllers/prayers_list_controller.dart';
import 'package:rpsp_main/app/modules/blog/controllers/blog_controller.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(),
    );
    Get.lazyPut<PlansController>(
      () => PlansController(),
    );
    Get.lazyPut<BibleController>(
      () => BibleController(),
    );
    Get.lazyPut<PrayersListController>(
      () => PrayersListController(),
    );
    Get.lazyPut<PersonalPlanController>(
      () => PersonalPlanController(),
    );
    Get.lazyPut<BlogController>(
      () => BlogController(),
    );
  }
}
