import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'premium_feature_widget.dart' show PremiumFeatureWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PremiumFeatureModel extends FlutterFlowModel<PremiumFeatureWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in OperationButton widget.
  bool? purchaseSuccess;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  void dispose() {
    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
