import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/assets.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/responsive/responsive_config.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int currentIndex = 0;
  List<Widget> tabs = [Container(), Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig.init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: 9.allPadding,
          child: SafeArea(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.circular(16)),
              child: NavigationBar(
                selectedIndex: currentIndex,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                onDestinationSelected: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                destinations: [
                  NavigationDestination(
                    icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                    selectedIcon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                    label: '',
                  ),
            
                  NavigationDestination(
                    icon: ImageIcon(AssetImage(AppAssets.searchIcon)),
                    selectedIcon: ImageIcon(AssetImage(AppAssets.searchIcon)),
                    label: '',
                  ),
            
                  NavigationDestination(
                    icon: ImageIcon(AssetImage(AppAssets.exploreIcon)),
                    selectedIcon: ImageIcon(AssetImage(AppAssets.exploreIcon)),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                    selectedIcon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: 16.horizontalPadding,
            child: tabs[currentIndex],
          ),
        ),
      ),
    );
  }
}
