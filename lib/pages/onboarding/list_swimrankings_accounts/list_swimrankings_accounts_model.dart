import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_swimrankings_accounts_widget.dart'
    show ListSwimrankingsAccountsWidget;
import 'package:flutter/material.dart';

class ListSwimrankingsAccountsModel
    extends FlutterFlowModel<ListSwimrankingsAccountsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Add favorited user)] action in SwimrankingsListItem widget.
  ApiCallResponse? apiResultbp8;
  // Stores action output result for [Action Block - GetUserAuth] action in SwimrankingsListItem widget.
  bool? userIsAuth2;
  // Stores action output result for [Action Block - GetUserAuth] action in SwimrankingsListItem widget.
  bool? userIsAuth;

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
