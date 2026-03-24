import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(AppLocalizations.of(context)!.helloWorld, style: AppTextStyles.roboto16Medium(color: AppColors.primaryColor)),
      ),
      body: const Center(
        child: LanguageToggle(),
      ),
    );
  }
}