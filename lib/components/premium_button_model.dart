import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'premium_button_widget.dart' show PremiumButtonWidget;
import 'package:flutter/material.dart';

class PremiumButtonModel extends FlutterFlowModel<PremiumButtonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel1;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel1 = createModel(context, () => OperationButtonModel());
    operationButtonModel2 = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    operationButtonModel1.dispose();
    operationButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
