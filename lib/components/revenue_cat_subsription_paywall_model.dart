import '/flutter_flow/flutter_flow_util.dart';
import '/pages/premium_feature_page/premium_feature_page_widget.dart';
import 'revenue_cat_subsription_paywall_widget.dart'
    show RevenueCatSubsriptionPaywallWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RevenueCatSubsriptionPaywallModel
    extends FlutterFlowModel<RevenueCatSubsriptionPaywallWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for premiumFeaturePage component.
  late PremiumFeaturePageModel premiumFeaturePageModel1;
  // Model for premiumFeaturePage component.
  late PremiumFeaturePageModel premiumFeaturePageModel2;
  // Model for premiumFeaturePage component.
  late PremiumFeaturePageModel premiumFeaturePageModel3;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? didPurchaseMonth;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    premiumFeaturePageModel1 =
        createModel(context, () => PremiumFeaturePageModel());
    premiumFeaturePageModel2 =
        createModel(context, () => PremiumFeaturePageModel());
    premiumFeaturePageModel3 =
        createModel(context, () => PremiumFeaturePageModel());
  }

  @override
  void dispose() {
    premiumFeaturePageModel1.dispose();
    premiumFeaturePageModel2.dispose();
    premiumFeaturePageModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
