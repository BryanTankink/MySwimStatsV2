import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'advice_details_widget.dart' show AdviceDetailsWidget;
import 'package:flutter/material.dart';

class AdviceDetailsModel extends FlutterFlowModel<AdviceDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (markRecomendationAsRead)] action in adviceDetails widget.
  ApiCallResponse? apiResult5s0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
