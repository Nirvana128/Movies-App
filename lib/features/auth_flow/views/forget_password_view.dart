import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/generated/assets.dart';
import 'package:movies_app/l10n/app_localizations.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(local.forgetPassword)),
      body: Padding(
        padding: 16.horizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              Assets.images.forgetPassword.image(),
              CustomTextField(
                hintText: local.email,
                prefixIcon: 'assets/icons/email.png',
              ),
              CustomButton(text: local.verifyEmail , onPressed:(){})
            ],
          ),
        ),
      ),
    );
  }
}
