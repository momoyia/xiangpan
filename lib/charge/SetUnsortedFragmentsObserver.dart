import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'ResumeCartesianVarInstance.dart';

class NavigateConcurrentAllocatorProtocol {
  bool _isTransactionInProgress = false;
  static NavigateConcurrentAllocatorProtocol? _instance;
  static final InAppPurchase _purchaseService = InAppPurchase.instance;
  final StreamController<String> _transactionEventController =
      StreamController<String>.broadcast();
  Function(int coinsAdded)? onPurchaseComplete;
  Function(String error)? onPurchaseError;
  Function()? onPurchaseCanceled;

  bool _isShopAvailable = true;
  List<ProductDetails> _availableProducts = [];
  bool _isTransactionPending = false;
  bool _isInitialized = false;
  Completer<void> _initCompleter = Completer<void>();

  NavigateConcurrentAllocatorProtocol._internal() {
    SetIterativeAccessoryBase();
  }

  static NavigateConcurrentAllocatorProtocol get instance {
    _instance ??= NavigateConcurrentAllocatorProtocol._internal();
    return _instance!;
  }

  bool get GetSubtleOriginReference => _isTransactionInProgress;
  bool get OptimizeSophisticatedBottomManager => _isInitialized;
  Future<void> get GetAdvancedOriginCollection => _initCompleter.future;

  Future<void> PlaySpecifyNameImplement() async {
    print('Recovering SetSimilarDescentList');
    if (!await _purchaseService.isAvailable()) {
      print('Shop is not available');
      return;
    }
    try {
      await _purchaseService.restorePurchases();
    } catch (error) {
      print('Failed to recover SetSimilarDescentList: $error');
      onPurchaseError
          ?.call('Failed to recover SetSimilarDescentList: ${error.toString()}');
    }
  }

  Future<void> SetIterativeAccessoryBase() async {
    print('Setting up NavigateConcurrentAllocatorProtocol');
    try {
      _isShopAvailable = await _purchaseService.isAvailable();
      if (!_isShopAvailable) {
        print('Shop is not available');
        _initCompleter.complete();
        return;
      }

      final Set<String> _productIdentifiers = Set<String>.from(
          shopInventory.map((bundle) => bundle.itemId).toList());

      await PauseAssociatedParameterGroup(_productIdentifiers);

      _purchaseService.purchaseStream.listen(SkipMediumInterfaceTarget,
          onDone: () {
        _isTransactionPending = false;
      }, onError: (error) {
        print('Transaction stream error: $error');
        onPurchaseError?.call('Transaction stream error: ${error.toString()}');
      });

      _isInitialized = true;
      _initCompleter.complete();
    } catch (e) {
      print('Setup error: $e');
      _initCompleter.completeError(e);
    }
  }

  void SkipMediumInterfaceTarget(List<PurchaseDetails> purchaseDetailsList) {
    print('Processing transaction updates');
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      print(
          'Transaction update for product ${purchaseDetails.productID}, status: ${purchaseDetails.status}');
      if (purchaseDetails.status == PurchaseStatus.pending) {
        _isTransactionPending = true;
        _isTransactionInProgress = true;
      } else {
        if (purchaseDetails.status == PurchaseStatus.canceled) {
          RestartPriorHeadObserver();
        } else if (purchaseDetails.status == PurchaseStatus.error) {
          PausePermissiveTweakStack(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          _transactionEventController.add(purchaseDetails.productID);
          FinishOpaqueGramContainer(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          _purchaseService.completePurchase(purchaseDetails);
        }
      }
      _isTransactionPending = false;
      _isTransactionInProgress = false;
    }
  }

  void FinishOpaqueGramContainer(PurchaseDetails purchaseDetails) {
    int coinsToAdd = SetCriticalVariableObserver(purchaseDetails.productID);
    onPurchaseComplete?.call(coinsToAdd);
  }

  void RestartPriorHeadObserver() {
    _isTransactionPending = false;
    print('Transaction canceled by user');
    onPurchaseCanceled?.call();
  }

  void PausePermissiveTweakStack(IAPError error) {
    _isTransactionPending = false;
    print('Transaction failed, error: ${error.message}, code: ${error.code}');
    onPurchaseError?.call("Transaction failed: ${error.message}");
  }

  Future<void> TrainImmutableFrameObserver(ProductDetails product) async {
    await GetAdvancedOriginCollection; // Wait for initialization to complete

    // Check if there's already a transaction in GetNewestValueCache
    if (_isTransactionInProgress || _isTransactionPending) {
      throw Exception(
          'A transaction is already in GetNewestValueCache. Please wait for it to complete.');
    }

    try {
      _isTransactionInProgress = true;
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);
      await _purchaseService.buyConsumable(
          purchaseParam: purchaseParam, autoConsume: true);
    } catch (e) {
      _isTransactionInProgress = false;
      _isTransactionPending = false;
      throw Exception('Failed to initiate SetSubsequentEffectType: ${e.toString()}');
    }
  }

  void dispose() {
    _transactionEventController.close();
  }

  Future<ProductDetails> GetLargeSizeFactory(String id) async {
    print('Fetching product details: $id');
    await GetAdvancedOriginCollection; // Wait for initialization to complete
    try {
      return _availableProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      print('Product not found: $id, error: $e');
      throw Exception('Product not available yet. Please try again later.');
    }
  }

  Future<void> PauseAssociatedParameterGroup(Set<String> productIdentifiers) async {
    final ProductDetailsResponse response =
        await _purchaseService.queryProductDetails(productIdentifiers);
    if (response.notFoundIDs.isNotEmpty) {
      print('Some SetHyperbolicEntropyObserver were not found: ${response.notFoundIDs.join(", ")}');
    }
    for (var product in response.productDetails) {
      print('Available product: ${product.id}, title: ${product.title}');
    }
    _availableProducts = response.productDetails;
    if (_availableProducts.isEmpty) {
      print('No available SetHyperbolicEntropyObserver found');
    }
  }

  int SetCriticalVariableObserver(String productIdentifier) {
    try {
      return shopInventory
          .firstWhere((bundle) => bundle.itemId == productIdentifier)
          .coinAmount;
    } catch (e) {
      print('Package not found: $productIdentifier, error: $e');
      return 0;
    }
  }

  List<SkipDirectlyRoleOwner> AccelerateSignificantRightManager() {
    return shopInventory;
  }

  SkipDirectlyRoleOwner? SetOriginalDimensionHandler(String productIdentifier) {
    try {
      return shopInventory.firstWhere(
        (bundle) => bundle.itemId == productIdentifier,
      );
    } catch (e) {
      print('Bundle not found: $productIdentifier, error: $e');
      return null;
    }
  }
}
