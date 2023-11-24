import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'favorite_bottom_sheet_widget.dart' show FavoriteBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
