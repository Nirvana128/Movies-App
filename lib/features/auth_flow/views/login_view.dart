import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/core/utils/dialog_utils.dart';
import 'package:movies_app/core/utils/toast_utils.dart';
import 'package:movies_app/core/utils/validation_utils.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/features/main_layout/main_layout_view.dart';
import 'package:movies_app/generated/assets.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/services/prefs_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: 16.horizontalPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 20.height,
              children: [
                Center(child: Assets.images.playIcon.image(height: 230)),
                CustomTextField(
                  validator: ValidationUtils.validateEmail,
                  controller: _emailController,
                  hintText: local.email,
                  prefixIcon: Assets.icons.email.path,
                ),
                CustomTextField(
                  validator: ValidationUtils.validatePassword,
                  isPassword: true,
                  controller: _passwordController,
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
                CustomButton(
                  text: local.login,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        DialogUtils.showLoading(context);

                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          DialogUtils.hideLoading(context);

                          ToastUtils.showSuccess(context, "Logged in successfully");

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => MainLayoutView()),
                          );

                        } on FirebaseAuthException catch (e) {
                          DialogUtils.hideLoading(context);

                          String message;

                          switch (e.code) {
                            case 'user-not-found':
                              message = "No account found with this email";
                              break;

                            case 'wrong-password':
                              message = "Incorrect password";
                              break;

                            case 'invalid-email':
                              message = "Invalid email format";
                              break;

                            case 'user-disabled':
                              message = "This account has been disabled";
                              break;

                            case 'too-many-requests':
                              message = "Too many attempts, try again later";
                              break;

                            default:
                              message = "Login failed, try again";
                          }

                          ToastUtils.showError(context, message);
                        }
                      }
                    }
                ),
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
      ),
    );
  }
}
