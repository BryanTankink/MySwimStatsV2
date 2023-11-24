import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'list_swimrankings_accounts_widget.dart'
    show ListSwimrankingsAccountsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
