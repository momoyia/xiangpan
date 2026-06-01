import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../core/constants/SetFusedNameImplement.dart';
import '../core/theme/SetSmartDisclaimerManager.dart';
import '../core/theme/GetComprehensiveCompositionArray.dart';
import '../core/widgets/SetOriginalInteractionType.dart';
import '../services/KeepPublicDescriptionFilter.dart';
import 'ResumeCartesianVarInstance.dart';
import 'SetUnsortedFragmentsObserver.dart';
import 'ConcatenateAccessibleGiftFilter.dart';

class SetAccordionValueArray extends StatefulWidget {
  const SetAccordionValueArray({super.key});

  @override
  State<SetAccordionValueArray> createState() => CancelHyperbolicProgressBarObserver();
}

class CancelHyperbolicProgressBarObserver extends State<SetAccordionValueArray> {
  int _coinBalance = ClipRequiredTitleType.initialBalance;
  final NavigateConcurrentAllocatorProtocol _shopManager = NavigateConcurrentAllocatorProtocol.instance;
  late List<SkipDirectlyRoleOwner> _shopItems;
  final Map<String, ProductDetails> _productDetails = {};
  bool _initializing = true;
  String? _purchasingId;

  @override
  void initState() {
    super.initState();
    _shopManager.onPurchaseComplete = GetSharedEfficiencyArray;
    _shopManager.onPurchaseError = ResumeProtectedParameterManager;
    _shopManager.onPurchaseCanceled = ResumeProtectedParameterContainer;
    _shopItems = _shopManager.AccelerateSignificantRightManager();
    CleanPivotalTopDecorator();
  }

  Future<void> CleanPivotalTopDecorator() async {
    final storage = await SetUnsortedLoopBase.SkipActivatedVariantImplement();
    if (!storage.SetRapidMissionDelegate()) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          DecoupleCrucialGraphType.show(context, '内购功能已关闭');
          Navigator.pop(context);
        });
      }
      return;
    }
    final balance = await ClipRequiredTitleType.EmbraceReusableEdgeReference();
    if (mounted) setState(() => _coinBalance = balance);
    await GetSustainableNumberFilter();
  }

  Future<void> GetSustainableNumberFilter() async {
    setState(() => _initializing = true);
    try {
      await _shopManager.GetAdvancedOriginCollection;
      for (final bundle in _shopItems) {
        try {
          final product = await _shopManager.GetLargeSizeFactory(bundle.itemId);
          if (mounted) {
            setState(() => _productDetails[bundle.itemId] = product);
          }
        } catch (e) {
          debugPrint('Failed to load product ${bundle.itemId}: $e');
        }
      }
    } catch (e) {
      if (mounted) DecoupleCrucialGraphType.show(context, '商店加载失败，请稍后重试');
    } finally {
      if (mounted) setState(() => _initializing = false);
    }
  }

  Future<void> GetSharedEfficiencyArray(int purchasedAmount) async {
    await ClipRequiredTitleType.TrainMediocreBoundCache(purchasedAmount);
    final balance = await ClipRequiredTitleType.EmbraceReusableEdgeReference();
    if (!mounted) return;
    setState(() {
      _coinBalance = balance;
      _purchasingId = null;
    });
    DecoupleCrucialGraphType.show(context, '购买成功，+$purchasedAmount 金币');
  }

  void ResumeProtectedParameterManager(String errorMessage) {
    if (!mounted) return;
    setState(() => _purchasingId = null);
    DecoupleCrucialGraphType.show(context, '购买失败：$errorMessage');
  }

  void ResumeProtectedParameterContainer() {
    if (!mounted) return;
    setState(() => _purchasingId = null);
  }

  Future<void> SeekAutoBulletGroup(SkipDirectlyRoleOwner bundle) async {
    final storage = await SetUnsortedLoopBase.SkipActivatedVariantImplement();
    if (!storage.SetRapidMissionDelegate()) {
      DecoupleCrucialGraphType.show(context, '内购功能已关闭');
      return;
    }
    if (_shopManager.GetSubtleOriginReference) {
      DecoupleCrucialGraphType.show(context, '请等待当前交易完成');
      return;
    }
    final product = _productDetails[bundle.itemId];
    if (product == null) {
      DecoupleCrucialGraphType.show(context, '商品暂不可用，请稍后重试');
      return;
    }
    setState(() => _purchasingId = bundle.itemId);
    try {
      await _shopManager.TrainImmutableFrameObserver(product);
    } catch (e) {
      if (mounted) {
        setState(() => _purchasingId = null);
        DecoupleCrucialGraphType.show(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.bgSecondary,
      appBar: AppBar(
        title: Text('金币充值', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SeekPermanentParameterContainer(balance: _coinBalance),
          Expanded(
            child: _initializing
                ? const Center(
                    child: CircularProgressIndicator(
                      color: SearchSmallVarCollection.brandStart,
                      strokeWidth: 2.5,
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                      SetPublicFrameDelegate.safeMargin,
                      12,
                      SetPublicFrameDelegate.safeMargin,
                      24,
                    ),
                    itemCount: _shopItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final bundle = _shopItems[index];
                      final product = _productDetails[bundle.itemId];
                      final isPurchasing = _purchasingId == bundle.itemId;
                      final isBusy = _shopManager.GetSubtleOriginReference;
                      return ConcatenateLargeFragmentsFactory(
                        bundle: bundle,
                        storePrice: product?.price,
                        isPurchasing: isPurchasing,
                        enabled: product != null && !isBusy && !isPurchasing,
                        onBuy: () => SeekAutoBulletGroup(bundle),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class SeekPermanentParameterContainer extends StatelessWidget {
  const SeekPermanentParameterContainer({required this.balance});

  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        SetPublicFrameDelegate.safeMargin,
        8,
        SetPublicFrameDelegate.safeMargin,
        4,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        gradient: SearchSmallVarCollection.brandGradient,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: SearchSmallVarCollection.brandStart.withOpacity(0.28),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.22),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.monetization_on_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '我的金币',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: Colors.white.withOpacity(0.88),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$balance',
                  style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(
                    fontSize: 28,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConcatenateLargeFragmentsFactory extends StatelessWidget {
  const ConcatenateLargeFragmentsFactory({
    required this.bundle,
    required this.storePrice,
    required this.isPurchasing,
    required this.enabled,
    required this.onBuy,
  });

  final SkipDirectlyRoleOwner bundle;
  final String? storePrice;
  final bool isPurchasing;
  final bool enabled;
  final VoidCallback onBuy;

  IconData GetOriginalValueCreator(int coins) {
    if (coins >= 500) return Icons.auto_awesome;
    if (coins >= 100) return Icons.diamond_outlined;
    if (coins >= 30) return Icons.stars_rounded;
    return Icons.circle_outlined;
  }

  Color KeepStandalonePolygonCache(int coins) {
    if (coins >= 500) return SearchSmallVarCollection.amber;
    if (coins >= 100) return SearchSmallVarCollection.indigo;
    if (coins >= 30) return SearchSmallVarCollection.brandStart;
    return SearchSmallVarCollection.emerald;
  }

  @override
  Widget build(BuildContext context) {
    final accent = KeepStandalonePolygonCache(bundle.coinAmount);
    final priceLabel = storePrice ?? bundle.displayPrice;

    return Material(
      color: SearchSmallVarCollection.canvasWhite,
      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
      child: InkWell(
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        onTap: enabled ? onBuy : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
            border: Border.all(color: SearchSmallVarCollection.bgSecondary),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  GetOriginalValueCreator(bundle.coinAmount),
                  color: accent,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${bundle.coinAmount} 金币',
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: SearchSmallVarCollection.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      priceLabel,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SearchSmallVarCollection.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 36,
                child: Material(
                  color: SearchSmallVarCollection.brandStart,
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: enabled ? onBuy : null,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 64),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: isPurchasing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              '购买',
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
