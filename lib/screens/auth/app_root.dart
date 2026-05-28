import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_data.dart';
import '../../models/onboarding_result.dart';
import '../../services/agreement_web_loader.dart';
import '../../services/storage_service.dart';
import '../main_shell.dart';
import 'login_page.dart';
import 'onboarding_flow.dart';
import 'splash_page.dart';

enum _AuthPhase { splash, login, onboarding, main }

/// 启动页 → 登录页 → 引导页 → 主页
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  _AuthPhase _phase = _AuthPhase.splash;
  StorageService? _storage;
  bool _promptTeenModeOnLaunch = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    AgreementWebLoader.preloadAll();
    final storage = await StorageService.getInstance();
    final loggedIn = storage.isLoggedIn();
    final onboardingDone = storage.hasCompletedOnboarding();
    await Future<void>.delayed(AppConstants.splashDuration);
    if (!mounted) return;
    setState(() {
      _storage = storage;
      if (!loggedIn) {
        _phase = _AuthPhase.login;
      } else if (!onboardingDone) {
        _phase = _AuthPhase.onboarding;
      } else {
        _phase = _AuthPhase.main;
      }
    });
  }

  Future<void> _completeLogin() async {
    await _storage!.setLoggedIn(true);
    if (!mounted) return;
    if (_storage!.hasCompletedOnboarding()) {
      setState(() => _phase = _AuthPhase.main);
    } else {
      setState(() => _phase = _AuthPhase.onboarding);
    }
  }

  Future<void> _completeOnboarding(OnboardingResult result) async {
    final existing = await _storage!.loadProfile();
    final base = existing ?? MockData.defaultProfile;
    final profile = base.copyWith(
      trainingGoals: result.trainingGoals,
      interestedSports: result.interestedSports,
      heightCm: result.heightCm,
      weightKg: result.weightKg,
    );
    await _storage!.saveProfile(profile);
    await _storage!.setOnboardingCompleted(true);
    if (!mounted) return;
    setState(() {
      _promptTeenModeOnLaunch = true;
      _phase = _AuthPhase.main;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_phase) {
      case _AuthPhase.splash:
        return const SplashPage();
      case _AuthPhase.login:
        return LoginPage(onLogin: _completeLogin);
      case _AuthPhase.onboarding:
        return OnboardingFlow(onComplete: _completeOnboarding);
      case _AuthPhase.main:
        return MainShell(promptTeenModeOnLaunch: _promptTeenModeOnLaunch);
    }
  }
}
