import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/generic/operation_button/operation_button_widget.dart';
import '/pages/generic/swimrankings_list_item/swimrankings_list_item_widget.dart';
import '/pages/profile/favorite_bottom_sheet/favorite_bottom_sheet_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'profile_users_page_widget.dart' show ProfileUsersPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUsersPageModel extends FlutterFlowModel<ProfileUsersPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for OperationButton component.
  late OperationButtonModel operationButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in OperationButton widget.
  bool? purchaseState;
  // Model for SwimrankingsListItem component.
  late SwimrankingsListItemModel swimrankingsListItemModel1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    operationButtonModel = createModel(context, () => OperationButtonModel());
    swimrankingsListItemModel1 =
        createModel(context, () => SwimrankingsListItemModel());
  }

  void dispose() {
    operationButtonModel.dispose();
    swimrankingsListItemModel1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
