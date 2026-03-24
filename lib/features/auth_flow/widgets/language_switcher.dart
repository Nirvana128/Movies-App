import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    int currentLanguageIndex = provider.currentLanguage == 'en' ? 0 : 1;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedToggleSwitch<int>.rolling(
        current: currentLanguageIndex,
        values: const [0, 1],
        loading: false,
        spacing: 15.width,

        onChanged: (i) async {
          // setState(() => currentLanguageIndex = i);
          provider.changeLanguage(i == 0 ? 'en' : 'ar');
          await Future.delayed(Duration(seconds: 3));
        },

        iconBuilder: (value, isSelected) {
          return SvgPicture.asset(
            value == 0 ? 'assets/svg/US.svg' : 'assets/svg/EG.svg',
            width: 35.square,
            height: 35.square,
          );
        },

        style: ToggleStyle(
          borderRadius: BorderRadius.circular(30),
          backgroundColor: AppColors.backgroundColor,
          indicatorColor: AppColors.primaryColor,
          borderColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
