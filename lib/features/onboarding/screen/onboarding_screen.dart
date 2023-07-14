import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/common/widgets/base_widgets/full_width_elevated_button.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';
import 'package:mobidoc/features/onboarding/screen/onboarding_screen_export.dart';

/// Main screen for onboarding feature.
@RoutePage(
  name: AppRouteNames.onboardingScreen,
)
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  /// Create an instance [OnboardingScreen].
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = onboardingWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return StateNotifierBuilder(
      listenableState: wm.currentPage,
      builder: (_, index) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    if (wm.isSkipButtonVisible)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: _SkipButton(
                          onPressed: wm.switchToLastPage,
                        ),
                      ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 136,
                        ),
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: wm.pageController,
                            itemCount: wm.pageCount,
                            itemBuilder: (_, pageNumber) {
                              return _OnboardingPageWidget(
                                assetName: wm
                                    .onboardingDataList[pageNumber].imageAsset,
                                title: wm.onboardingDataList[pageNumber].title,
                                text: wm.onboardingDataList[pageNumber].body,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FullWidthElevatedButton(
                          child: Text(
                            wm.onboardingDataList[wm.currentPage.value ?? 0]
                                .continueButtonText,
                            style: wm.textScheme.bold18,
                          ),
                          onPressed: () {
                            wm.switchToNextPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Create an instance [OnboardingScreen].
}

class _OnboardingPageWidget extends StatelessWidget {
  const _OnboardingPageWidget({
    required this.assetName,
    required this.title,
    required this.text,
  });

  final String assetName;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(assetName),
        Column(
          children: [
            Text(
              title,
              style: textTheme.bold18,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 220,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textTheme.regular16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Text(
        'Пропустить',
        style: AppTextTheme.of(context).medium16,
      ),
    );
  }
}
