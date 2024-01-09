import '/components/revenue_cat_subsription_paywall_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'premium_sheet_widget.dart' show PremiumSheetWidget;
import 'package:flutter/material.dart';

class PremiumSheetModel extends FlutterFlowModel<PremiumSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RevenueCatSubsriptionPaywall component.
  late RevenueCatSubsriptionPaywallModel revenueCatSubsriptionPaywallModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    revenueCatSubsriptionPaywallModel =
        createModel(context, () => RevenueCatSubsriptionPaywallModel());
  }

  @override
  void dispose() {
    revenueCatSubsriptionPaywallModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
