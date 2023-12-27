import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import 'link_swimrankings_widget.dart' show LinkSwimrankingsWidget;
import 'package:flutter/material.dart';

class LinkSwimrankingsModel extends FlutterFlowModel<LinkSwimrankingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [Backend Call - API (Verify fullName)] action in OperationButton widget.
  ApiCallResponse? nameVerifyResultCopy;
  // Stores action output result for [Backend Call - API (Add favorited user)] action in OperationButton widget.
  ApiCallResponse? apiResultbp8;
  // Stores action output result for [Backend Call - API (Set active user)] action in OperationButton widget.
  ApiCallResponse? apiResultd62;
  // Stores action output result for [Action Block - GetUserAuth] action in OperationButton widget.
  bool? hasValidUserAuthCopy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    operationButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
