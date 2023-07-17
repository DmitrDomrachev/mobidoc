import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/login/screen/login_screen_widget.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/onboarding/models/onboarding_data.dart';
import 'package:mobidoc/features/onboarding/screen/onboarding_screen_export.dart';

/// Factory for [OnboardingScreenWidgetModel].
OnboardingScreenWidgetModel onboardingWMFactory(
  BuildContext _,
) {
  final data = <OnboardingData>[
    OnboardingData(
      'assets/images/onb_first.svg',
      'Обращайтесь к врачу',
      'Консультациия посредством мобильной связи',
      'Ох ты!',
    ),
    OnboardingData(
      'assets/images/onb_sec.svg',
      'Большой ассортимент',
      'Большой ассортимент врачей, с которыми можно пообщаться',
      'Обалдеть!',
    ),
    OnboardingData(
      'assets/images/onb_third.svg',
      'Электронная медкарта',
      'Возможность использования смартфона в качестве медкарты',
      'Начать работу!',
    ),
  ];

  final model = OnboardingScreenModel(onboardingDataList: data);
  return OnboardingScreenWidgetModel(model);
}

/// Widget model for [OnboardingScreen].
class OnboardingScreenWidgetModel
    extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    with ThemeWMMixin
    implements IOnboardingScreenWidgetModel {
  final _currentPage = StateNotifier<int>(initValue: 0);
  final _pageController = PageController();

  @override
  int get pageCount => _pageCount;

  @override
  StateNotifier<int> get currentPage => _currentPage;

  @override
  List<OnboardingData> get onboardingDataList => model.onboardingDataList;

  @override
  OnboardingData get currentOnboardingData =>
      model.onboardingDataList[currentPage.value ?? 0];

  @override
  PageController get pageController => _pageController;

  @override
  bool get isSkipButtonVisible {
    return (currentPage.value ?? 0) != (pageCount - 1);
  }

  late int _pageCount;

  /// Create an instance [OnboardingScreenWidgetModel].
  OnboardingScreenWidgetModel(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _pageCount = model.onboardingDataList.length;
  }

  @override
  void switchToLastPage() {
    _currentPage.accept(pageCount - 1);
    _pageController.animateToPage(
      pageCount - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void switchToNextPage() {
    var pageNum = currentPage.value ?? 0;
    if (pageNum < (_pageCount - 1)) {
      pageNum++;
      _currentPage.accept(pageNum);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _navigateToLoginScreen(context);
    }
  }
}

void _navigateToLoginScreen(BuildContext context) {
  context.router.replaceNamed(AppRoutePaths.loginPath);
}

/// Interface of [OnboardingScreenWidgetModel].
abstract class IOnboardingScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Count of onboarding pages.
  int get pageCount;

  /// Listener current page index.
  ListenableState<int> get currentPage;

  /// List of [OnboardingData].
  List<OnboardingData> get onboardingDataList;

  /// Element of [onboardingDataList] with [currentPage]index .
  OnboardingData get currentOnboardingData;

  /// Page view controller.
  PageController get pageController;

  /// Skip button visibility value.
  bool get isSkipButtonVisible;

  /// Switch [currentPage] to next and animate [pageController].
  /// If [currentPage] is the last page, function will navigate to [LoginScreen].
  void switchToNextPage();

  /// Switch [currentPage] to last and animate [pageController].
  void switchToLastPage();
}
