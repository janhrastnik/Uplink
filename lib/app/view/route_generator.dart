import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/app/view/main_app.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    //Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<void>(
          builder: (context) {
            final themeData = context.watch<ThemeModel>().getThemeData;
            return MainApp(themeData: themeData);
          },
        );
      case '/OnboardCreateAccount':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardCreateAccountPage(),
        );
      case '/OnboardImportAccount':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardImportAccountPage(),
        );
      case '/OnboardRecoverySeed':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardRecoverySeedPage(),
        );
      case '/OnboardPrivacySettingFirst':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardPrivacySettingFirstPage(),
        );
      case '/OnboardPrivacySettingSecond':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardPrivacySettingSecondPage(),
        );
      case '/OnboardCreateProfile':
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardCreateProfilePage(),
        );
      case '/MainBottomNavigationBar':
        return MaterialPageRoute<void>(
          builder: (context) => const MainBottomNavigationBar(),
        );
      default:
        // TODO(yijing): improve error page
        return MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(child: Text('This page does not exist')),
            );
          },
        );
    }
  }
}
