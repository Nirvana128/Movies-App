import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth_flow/widgets/avatar_container.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/l10n/app_localizations.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  List<String> imageList = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

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
        child: SingleChildScrollView(
          child: Column(
            spacing: 24.height,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 170.height,
                  viewportFraction: 0.35,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.45,
                  scrollDirection: Axis.horizontal,
                ),
                items: imageList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return AvatarContainer(i: i);
                    },
                  );
                }).toList(),
              ),

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
              CustomButton(
                text: AppLocalizations.of(context)!.createAccount,
                onPressed: () {},
              ),
              Text.rich(
                TextSpan(
                  text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
                  style: AppTextStyles.regular14(color: AppColors.white),
                  children: [
                    TextSpan(
                      onEnter: (event) {
                        // Navigator.pushReplacementNamed(context, '/login');
                      },
                      text: ' ${AppLocalizations.of(context)!.login}',
                      style: AppTextStyles.bold14(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              LanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
