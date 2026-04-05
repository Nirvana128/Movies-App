import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/responsive/responsive_config.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/auth_flow/views/forget_password_view.dart';
import 'package:movies_app/features/auth_flow/views/login_view.dart';
import 'package:movies_app/features/auth_flow/views/register_view.dart';
import 'package:movies_app/features/initial_flow/onboarding/onboarding_screen.dart';
import 'package:movies_app/features/main_layout/main_layout_view.dart';
import 'package:movies_app/features/initial_flow/splash/splash_screen.dart';
import 'package:movies_app/features/main_layout/profile_tab/Editing_Profile.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/services/prefs_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final bool seenIntro = await PrefsService.hasSeenIntro();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MoviesApp(seenIntro: seenIntro),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  final bool seenIntro;
  
  const MoviesApp({super.key, required this.seenIntro});

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

      initialRoute: AppRoutes.login,

      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.register: (context) => RegisterView(),
        AppRoutes.login: (context) => const LoginView(),
        AppRoutes.forgetPassword: (context) => const ForgetPasswordView(),
        AppRoutes.editProfileScreen: (context) => EditProfileScreen(),
        AppRoutes.mainLayoutView: (context) => const MainLayoutView(),
      },
    );
  }

  String getInitialRoute() {
    if (!seenIntro) {
      return AppRoutes.onboarding;
    } else {
      return AppRoutes.mainLayoutView;
    }
  }
}
