import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'about_widget.dart' show AboutWidget;
import 'package:flutter/material.dart';

class AboutModel extends FlutterFlowModel<AboutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel1;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel2;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel1 = createModel(context, () => OperationButtonModel());
    operationButtonModel2 = createModel(context, () => OperationButtonModel());
    operationButtonModel3 = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    operationButtonModel1.dispose();
    operationButtonModel2.dispose();
    operationButtonModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
