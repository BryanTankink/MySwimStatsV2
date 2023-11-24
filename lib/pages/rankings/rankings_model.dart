import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'rankings_widget.dart' show RankingsWidget;
import 'package:flutter/material.dart';

class RankingsModel extends FlutterFlowModel<RankingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Set active user)] action in Container widget.
  ApiCallResponse? apiResult5z2;

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
