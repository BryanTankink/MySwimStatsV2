import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'error_page_widget.dart' show ErrorPageWidget;
import 'package:flutter/material.dart';

class ErrorPageModel extends FlutterFlowModel<ErrorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
