import 'package:get/get.dart';

import 'package:rpsp_main/app/modules/auth/bindings/auth_binding.dart';
import 'package:rpsp_main/app/modules/auth/views/auth_view.dart';
import 'package:rpsp_main/app/modules/bible/bindings/bible_binding.dart';
import 'package:rpsp_main/app/modules/bible/views/bible_view.dart';
import 'package:rpsp_main/app/modules/blog/bindings/blog_binding.dart';
import 'package:rpsp_main/app/modules/blog/views/blog_view.dart';
import 'package:rpsp_main/app/modules/bottom_bar/bindings/bottom_bar_binding.dart';
import 'package:rpsp_main/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:rpsp_main/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:rpsp_main/app/modules/edit_profile/views/edit_profile_view.dart';
//import 'package:rpsp_main/app/modules/favorites/bindings/favorites_binding.dart';
//import 'package:rpsp_main/app/modules/favorites/views/favorites_view.dart';
import 'package:rpsp_main/app/modules/home/bindings/home_binding.dart';
import 'package:rpsp_main/app/modules/home/views/home_view.dart';
import 'package:rpsp_main/app/modules/hymn_player/bindings/hymn_player_binding.dart';
import 'package:rpsp_main/app/modules/hymn_player/views/hymn_player_view.dart';
import 'package:rpsp_main/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:rpsp_main/app/modules/onboarding/views/onboarding_view.dart';
import 'package:rpsp_main/app/modules/perfil/bindings/perfil_binding.dart';
import 'package:rpsp_main/app/modules/perfil/views/perfil_view.dart';
import 'package:rpsp_main/app/modules/personal_plan/bindings/personal_plan_binding.dart';
import 'package:rpsp_main/app/modules/personal_plan/views/personal_plan_view.dart';
import 'package:rpsp_main/app/modules/plans/bindings/plans_binding.dart';
import 'package:rpsp_main/app/modules/plans/views/plans_view.dart';
import 'package:rpsp_main/app/modules/prayers_list/bindings/prayers_list_binding.dart';
import 'package:rpsp_main/app/modules/prayers_list/views/prayers_list_view.dart';
import 'package:rpsp_main/app/modules/video_player/bindings/video_player_binding.dart';
import 'package:rpsp_main/app/modules/video_player/views/video_player_view.dart';
import 'package:rpsp_main/app/modules/video_player/views/video_youtube.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.bottomBar;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.bottomBar,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.plans,
      page: () => const PlansView(),
      binding: PlansBinding(),
    ),
    GetPage(
      name: _Paths.favorites,
      page: () => const BibleView(),
      binding: BibleBinding(),
    ),
    // GetPage(
    //   name: _Paths.FAVORITES,
    //   page: () => const FavoritesView(),
    //   binding: FavoritesBinding(),
    // ),
    GetPage(
      name: _Paths.bible,
      page: () => const BibleView(),
      binding: BibleBinding(),
    ),
    // GetPage(
    //   name: _Paths.TEXT,
    //   page: () => TextView(),
    //   binding: TextBinding(),
    // ),
    GetPage(
      name: _Paths.prayersList,
      page: () => const PrayersListView(),
      binding: PrayersListBinding(),
    ),
    GetPage(
      name: _Paths.videoPlayer,
      page: () => const VideoPlayerView(),
      binding: VideoPlayerBinding(),
    ),

    GetPage(
      name: _Paths.youtubePlayer,
      page: () => YouTubeVideoListScreen(),
      binding: VideoPlayerBinding(),
    ),

    GetPage(
      name: _Paths.personalPlan,
      page: () => const PersonalPlanView(),
      binding: PersonalPlanBinding(),
    ),
    // GetPage(
    //   name: _Paths.CITA_DIARIA,
    //   page: () => CitaDiariaView(),
    //   binding: CitaDiariaBinding(),
    // ),
    GetPage(
      name: _Paths.hymnPlayer,
      page: () => HymnPlayerView(),
      binding: HymnPlayerBinding(),
    ),
    GetPage(
      name: _Paths.blogView,
      page: () => BlogView(),
      binding: BlogBinding(),
    ),
  ];
}
