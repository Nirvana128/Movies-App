import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/responsive/responsive_config.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/auth_flow/views/register_view.dart';
import 'package:movies_app/features/onboarding/onboarding_screen.dart';
import 'package:movies_app/features/profile/Editing_Profile.dart';
import 'package:movies_app/features/splash/splash_screen.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // test the editing
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    ResponsiveConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage),

      // dynamic font based on locale
      builder: (context, child) {
        final lang = languageProvider.currentLanguage;

        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: lang == 'ar'
                ? GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
                : GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          ),
          child: child!,
        );
      },

      theme: AppTheme.theme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.register: (context) => RegisterView(),
        AppRoutes.EditProfileScreen: (context) => const EditProfileScreen(),
      },
    );
  }
}
