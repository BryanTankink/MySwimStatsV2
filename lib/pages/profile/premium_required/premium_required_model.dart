import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/premium_feature/premium_feature_widget.dart';
import 'premium_required_widget.dart' show PremiumRequiredWidget;
import 'package:flutter/material.dart';

class PremiumRequiredModel extends FlutterFlowModel<PremiumRequiredWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for premiumFeature component.
  late PremiumFeatureModel premiumFeatureModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    premiumFeatureModel = createModel(context, () => PremiumFeatureModel());
  }

  @override
  void dispose() {
    premiumFeatureModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
