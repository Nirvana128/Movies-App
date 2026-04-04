import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth_flow/widgets/avatar_container.dart';
import 'package:movies_app/features/auth_flow/widgets/language_switcher.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/services/firebase_auth_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  int _selectedAvatarIndex = 0;
  bool isLoading = false;

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
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String? error = await FirebaseAuthService.registerUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _phoneController.text.trim(),
        avatarIndex: _selectedAvatarIndex,
      );

      setState(() {
        isLoading = false;
      });

      if (error == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Account Created Successfully!"), backgroundColor: Colors.green),
        );
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: AppColors.red),
        );
      }
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppTextStyles.medium16(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: 16.horizontalPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 24.height,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 170.height,
                    viewportFraction: 0.35,
                    initialPage: _selectedAvatarIndex,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.45,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _selectedAvatarIndex = index;
                      });
                    },
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
                  controller: _nameController,
                  hintText: AppLocalizations.of(context)!.name,
                  prefixIcon: 'assets/icons/name.png',
                  validator: (value) => value == null || value.trim().isEmpty ? 'Please enter your name' : null,
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: 'assets/icons/email.png',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'Please enter your email';
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                    if (!emailValid) return 'Please enter a valid email';
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: 'assets/icons/password.png',
                  isPassword: true,
                  validator: (value) => value == null || value.length < 6 ? 'Password must be at least 6 characters' : null,
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppLocalizations.of(context)!.confirmPassword,
                  prefixIcon: 'assets/icons/password.png',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please confirm your password';
                    if (value != _passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _phoneController,
                  hintText: AppLocalizations.of(context)!.phoneNumber,
                  prefixIcon: 'assets/icons/phone.png',
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.trim().isEmpty ? 'Please enter your phone number' : null,
                ),

                isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
                    : CustomButton(
                  text: AppLocalizations.of(context)!.createAccount,
                  onPressed: _register,
                ),

                Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
                    style: AppTextStyles.regular14(color: AppColors.white),
                    children: [
                      TextSpan(
                        text: ' ${AppLocalizations.of(context)!.login}',
                        style: AppTextStyles.bold14(
                          color: AppColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                          },
                      ),
                    ],
                  ),
                ),
                const LanguageToggle(),
                SizedBox(height: 20.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}