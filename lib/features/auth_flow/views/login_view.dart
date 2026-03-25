import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/generated/assets.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: 16.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.height,
            children: [
              Center(child: Assets.images.playIcon.image(height: 230)),
              CustomTextField(
                hintText: local.email,
                prefixIcon: Assets.icons.email.path,
              ),
              CustomTextField(
                hintText: local.password,
                prefixIcon: Assets.icons.password.path,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: Text(
                    local.forgetPassword,
                    style: AppTextStyles.regular14(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              CustomButton(text: local.login, onPressed: () {}),
              //Login Button
              Text.rich(
                TextSpan(
                  text: local.dontHaveAccount,
                  style: AppTextStyles.regular14(color: AppColors.white),
                  children: [
                    TextSpan(
                      text: local.createOne,
                      style: AppTextStyles.bold14(
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      height: 2,
                      thickness: 1,
                      indent: 55,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    local.or,
                    style: AppTextStyles.regular14(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      height: 2,
                      thickness: 1,
                      indent: 10,
                      endIndent: 55,
                    ),
                  ),
                ],
              ),
              //or
              CustomButton(
                text: local.loginWithGoogle,
                onPressed: () {},
                icon: Assets.icons.google.image(width: 20),
                //Google
              ),
              SizedBox(height: 10.height),
              LanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
