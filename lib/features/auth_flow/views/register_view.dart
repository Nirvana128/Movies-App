import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppTextStyles.medium16(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: 16.horizontalPadding,
        child: Column(
          spacing: 24.height,
          children: [
            CustomTextField(
              hintText: AppLocalizations.of(context)!.name,
              prefixIcon: 'assets/icons/name.png',
            ),
            CustomTextField(
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: 'assets/icons/email.png',
            ),
            CustomTextField(
              hintText: AppLocalizations.of(context)!.password,
                prefixIcon: 'assets/icons/password.png',
            ),
            CustomTextField(
              hintText: AppLocalizations.of(context)!.confirmPassword,
              prefixIcon: 'assets/icons/password.png',
            ),
            CustomTextField(
              hintText: AppLocalizations.of(context)!.phoneNumber,
              prefixIcon: 'assets/icons/phone.png',
            ),
            
            LanguageToggle(),
          ],
        ),
      ),
    );
  }
}
