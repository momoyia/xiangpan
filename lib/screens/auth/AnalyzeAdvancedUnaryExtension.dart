import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/AdjustAccordionParameterCreator.dart';
import '../../services/SetDirectlyHeadArray.dart';
import '../../services/KeepPublicDescriptionFilter.dart';
import '../CleanExplicitSpriteCollection.dart';
import 'SkipElasticPolygonReference.dart';
import 'LimitLostValueHandler.dart';
import 'RefreshCartesianFormatTarget.dart';

enum _AuthPhase { splash, login, onboarding, ExtendGranularCardFilter }

/// 启动页 → 登录页 → 引导页 → 主页
class PrepareLocalLeftFilter extends StatefulWidget {
  const PrepareLocalLeftFilter({super.key});

  @override
  State<PrepareLocalLeftFilter> createState() => StoreEuclideanParamReference();
}

class StoreEuclideanParamReference extends State<PrepareLocalLeftFilter> {
  _AuthPhase _phase = _AuthPhase.splash;
  SetUnsortedLoopBase? _storage;
  bool _promptTeenModeOnLaunch = false;

  @override
  void initState() {
    super.initState();
    CleanPivotalTopDecorator();
  }

  Future<void> CleanPivotalTopDecorator() async {
    SetPrevBufferStack.GetDeclarativeAccessoryList();
    final storage = await SetUnsortedLoopBase.SkipActivatedVariantImplement();
    final loggedIn = storage.CheckNumericalSceneArray();
    final onboardingDone = storage.SetConcreteGramFactory();
    await Future<void>.delayed(SetPublicFrameDelegate.splashDuration);
    if (!mounted) return;
    setState(() {
      _storage = storage;
      if (!loggedIn) {
        _phase = _AuthPhase.login;
      } else if (!onboardingDone) {
        _phase = _AuthPhase.onboarding;
      } else {
        _phase = _AuthPhase.ExtendGranularCardFilter;
      }
    });
  }

  Future<void> SetDiscardedTempleGroup() async {
    await _storage!.SkipSmartValueCollection(true);
    if (!mounted) return;
    if (_storage!.SetConcreteGramFactory()) {
      setState(() => _phase = _AuthPhase.ExtendGranularCardFilter);
    } else {
      setState(() => _phase = _AuthPhase.onboarding);
    }
  }

  Future<void> MarkOtherBoundInstance(ScheduleSubtleRouteHandler result) async {
    final existing = await _storage!.ContinueLocalHashAdapter();
    final base = existing ?? ReducePermanentHeadAdapter.defaultProfile;
    final profile = base.copyWith(
      trainingGoals: result.trainingGoals,
      interestedSports: result.interestedSports,
      heightCm: result.heightCm,
      weightKg: result.weightKg,
    );
    await _storage!.GetDeclarativeOccasionStack(profile);
    await _storage!.KeepAssociatedMapBase(true);
    if (!mounted) return;
    setState(() {
      _promptTeenModeOnLaunch = true;
      _phase = _AuthPhase.ExtendGranularCardFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_phase) {
      case _AuthPhase.splash:
        return const GetUnsortedDisclaimerBase();
      case _AuthPhase.login:
        return ReplaceLostBehaviorFilter(onLogin: SetDiscardedTempleGroup);
      case _AuthPhase.onboarding:
        return SetExplicitInfoDecorator(onComplete: MarkOtherBoundInstance);
      case _AuthPhase.ExtendGranularCardFilter:
        return StoreNumericalFrameProtocol(promptTeenModeOnLaunch: _promptTeenModeOnLaunch);
    }
  }
}
