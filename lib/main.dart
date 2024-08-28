import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rpsp_main/generated/l10n.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/share_prefs/storage_prefs.dart';
import 'app/shared/theme/theme.dart';
import 'app/shared/theme/theme_dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = StoragePrefs();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _prefs = StoragePrefs();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: _prefs.darkTheme ? themeDark() : themeLight(),
      debugShowCheckedModeBanner: false,
      title: "RPSP",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
