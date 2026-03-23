import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_button.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;
  final String primaryButtonText;
  final bool hasBackButton;
  final bool isFullScreenImage;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
    this.primaryButtonText = "Next",
    this.hasBackButton = true,
    this.isFullScreenImage = false,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<OnboardingModel> screens = [
    OnboardingModel(
      imagePath: "assets/images/onboarding11.png",
      title: "Find Your Next\nFavorite Movie Here",
      description: "Get access to a huge library of movies\nto suit all tastes. You will surely like it.",
      primaryButtonText: "Explore Now",
      hasBackButton: false,
      isFullScreenImage: true,
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding1.png",
      title: "Discover Movies",
      description: "Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease.",
      hasBackButton: false,
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding2.png",
      title: "Explore All Genres",
      description: "Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding3.png",
      title: "Create Watchlists",
      description: "Save movies to your watchlist to keep\ntrack of what you want to watch next.",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding4.png",
      title: "Rate, Review, and Learn",
      description: "Share your thoughts on the movies\nyou've watched. Dive deep into film\ndetails and help others.",
    ),
    OnboardingModel(
      imagePath: "assets/images/onboarding5.png",
      title: "Start Watching Now",
      description: "",
      primaryButtonText: "Finish",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PageView.builder(
        controller: _pageController,
        itemCount: screens.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  screens[index].imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              if (screens[index].isFullScreenImage) ...[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          AppColors.backgroundColor,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          screens[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          screens[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        CustomButton(
                          text: screens[index].primaryButtonText,
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]
              else ...[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (screens[index].title.isNotEmpty) ...[
                          Text(
                            screens[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (screens[index].description.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Text(
                              screens[index].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ],
                          const SizedBox(height: 32),
                        ],
                        CustomButton(
                          text: screens[index].primaryButtonText,
                          onPressed: () {
                            if (currentIndex == screens.length - 1) {
                              print("Go To Login");
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                        if (screens[index].hasBackButton) ...[
                          const SizedBox(height: 16),
                          CustomButton(
                            text: 'Back',
                            isOutlined: true,
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}