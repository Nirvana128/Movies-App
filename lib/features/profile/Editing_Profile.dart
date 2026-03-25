import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/AppData.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/l10n/app_localizations.dart';

import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController(
    text: "John Safwat",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "01200000000",
  );

  int selectedIndex = 4;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 20.width,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppLocalizations.of(context)!.pick_avatar,
          style: AppTextStyles.medium16(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: 20.horizontalPadding,
        child: Column(
          children: [
            20.verticalSizedBox,
            GestureDetector(
              onTap: () => _showAvatarPicker(context),
              child: CircleAvatar(
                radius: 55.width,
                backgroundColor: AppColors.transparent,
                backgroundImage: AssetImage(AppData.allAvatars[selectedIndex]),
              ),
            ),
            30.verticalSizedBox,
            CustomTextField(
              controller: nameController,
              hintText: AppLocalizations.of(context)!.name,
              prefixIcon: Icons.person,
            ),
            16.verticalSizedBox,
            CustomTextField(
              controller: phoneController,
              hintText: AppLocalizations.of(context)!.phoneNumber,
              prefixIcon: Icons.phone,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  AppLocalizations.of(context)!.reset_password,
                  style: AppTextStyles.regular16(color: AppColors.white),
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: AppLocalizations.of(context)!.delete_account,
              backgroundColor: AppColors.red,
              textColor: AppColors.white,
              onPressed: () {},
            ),
            12.verticalSizedBox,
            CustomButton(
              text: AppLocalizations.of(context)!.update_data,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Profile Updated Successfully!"),
                  ),
                );
              },
            ),
            30.verticalSizedBox,
          ],
        ),
      ),
    );
  }

  void _showAvatarPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              margin: 16.allPadding,
              padding: 16.allPadding,
              decoration: BoxDecoration(
                color: AppColors.secondaryBackgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: AppData.allAvatars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  bool isSelected = (selectedIndex == index);
                  return GestureDetector(
                    onTap: () {
                      setModalState(() => selectedIndex = index);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isSelected
                            ? AppColors.primaryTransparent
                            : AppColors.transparent,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppData.allAvatars[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
