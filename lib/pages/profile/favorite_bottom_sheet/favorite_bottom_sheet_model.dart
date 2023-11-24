import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorite_bottom_sheet_widget.dart' show FavoriteBottomSheetWidget;
import 'package:flutter/material.dart';

class FavoriteBottomSheetModel
    extends FlutterFlowModel<FavoriteBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Set active user)] action in Button widget.
  ApiCallResponse? apiResultoov;
  // Stores action output result for [Action Block - GetUserAuth] action in Button widget.
  bool? userAuthOk;
  // Stores action output result for [Backend Call - API (Delete favorited user)] action in Button widget.
  ApiCallResponse? apiResulthws;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
